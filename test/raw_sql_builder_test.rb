require 'test_helper'

class RawSqlBuilderTest < Minitest::Test
  def test_that_it_has_a_version_number
    assert_not_nil ::RawSqlBuilder::VERSION
  end

  def setup
    @objects = User.all
  end

  def test_mass_create
    assert_not_nil RawSqlBuilder.mass_create(prep_objects_for_benchmark(@objects, 50, true))
  end

  def test_mass_update
    assert_not_nil RawSqlBuilder.mass_update(prep_objects_for_benchmark(@objects, 50))
  end

  def test_mass_create_or_update
    assert_not_nil RawSqlBuilder.mass_create_or_update(
      prep_objects_for_benchmark(@objects, 25, true) + prep_objects_for_benchmark(@objects, 25))
  end

  def test_create_or_update_all_tables
    ActiveRecord::Base.connection.tables.each do |t|
      objects = t.camelize.singularize.constantize.order(id: :asc).limit(10)
      next if objects.none?
      assert_not_nil RawSqlBuilder.mass_create_or_update(
        prep_objects_for_benchmark(objects, 25, true) + prep_objects_for_benchmark(objects, 25))
    end
  end

  def test_created_at_and_updated_at_on_create
    RawSqlBuilder.mass_create(prep_objects_for_benchmark(@objects, 50, true))
    assert @objects.first.created_at > Time.zone.now - 5.minutes
    assert @objects.first.updated_at > Time.zone.now - 5.minutes
  end

  def test_updated_at_on_update
    RawSqlBuilder.mass_update(prep_objects_for_benchmark(@objects, 50))
    assert @objects.first.updated_at > Time.zone.now - 5.minutes
  end

  private

  def prep_objects_for_benchmark(objects, percent, new = false)
    objects = [*objects]
    object_class = objects.first.class
    objects_array = []
    objects[0..((objects.size * (percent.to_f / 100)).ceil)].each do |o|
      obj = new ? object_class.new : o
      obj.attributes.each do |k, v|
        if v.is_a?(String) && [true, false].sample
          obj[k] = (0...20).map { (65 + rand(26)).chr }.join
        end
      end

      obj.last_name = "O'Reilly" if object_class.columns_hash['last_name']
      objects_array << obj
    end
    objects_array
  end
end
