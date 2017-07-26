require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test

  def test_it_exists
    reunion = Reunion.new("Denver")

    assert_instance_of Reunion, reunion
  end

  def test_it_has_a_name
    reunion = Reunion.new("Denver")

    assert_equal "Denver", reunion.name
  end

  def test_it_starts_with_no_activities
    reunion = Reunion.new("Denver")

    assert_empty reunion.activities
  end

  def test_it_can_add_activities
    reunion = Reunion.new("Denver")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Jim", 20)
    activity_1.add_participant("Joe", 40)

    reunion.add_activity(activity_1)

    assert_equal activity_1, reunion.activities[0]
  end

  def test_it_can_gather_total_cost_from_activity
    reunion = Reunion.new("Denver")
    activity_1 = Activity.new("Brunch")

    activity_1.add_participant("Jim", 20)
    activity_1.add_participant("Joe", 40)
    reunion.add_activity(activity_1)

    assert_equal 60, reunion.total_cost
  end

  def test_it_can_gather_total_cost_from_multiple_activities
    reunion = Reunion.new("Denver")
    activity_1 = Activity.new("Brunch")
    activity_2 = Activity.new("Drinks")

    activity_1.add_participant("Jim", 20)
    activity_1.add_participant("Joe", 40)
    reunion.add_activity(activity_1)

    activity_2.add_participant("Jim", 60)
    activity_2.add_participant("John", 80)
    reunion.add_activity(activity_2)

    assert_equal 200, reunion.total_cost
  end

end
