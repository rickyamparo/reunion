require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require 'pry'

class ActivityTest < Minitest::Test

  def test_it_exists
    brunch = Activity.new("Brunch")

    assert_instance_of Activity, brunch
  end

  def test_it_has_a_name
    brunch = Activity.new("Brunch")

    assert_equal "Brunch", brunch.name
  end

  def test_it_starts_with_no_participants
    brunch = Activity.new("Brunch")

    assert_instance_of Hash, brunch.participants
    assert_empty brunch.participants
  end

  def test_it_can_add_participants
    brunch = Activity.new("Brunch")

    brunch.add_participant("Jim", 20)

    assert_equal 20, brunch.participants["Jim"]
  end

  def test_it_can_add_total_cost
    brunch = Activity.new("Brunch")

    assert_equal 0, brunch.total_cost

    brunch.add_participant("Jim", 20)

    assert_equal 20, brunch.total_cost

    brunch.add_participant("Joe", 40)

    assert_equal 60, brunch.total_cost
  end

  def test_it_can_split_total
    brunch = Activity.new("Brunch")
    brunch.add_participant("Jim", 20)
    brunch.add_participant("Joe", 40)

    assert_equal 60, brunch.total_cost
    assert_equal 30, brunch.split
  end

  def test_it_can_calculate_owed
    brunch = Activity.new("Brunch")
    brunch.add_participant("Jim", 20)
    brunch.add_participant("Joe", 40)

    binding.pry
  end

end
