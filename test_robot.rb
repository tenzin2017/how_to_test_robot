require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
    robot = Robot.new
    robot.needs_repairs = true
    robot.foreign_model = true

    # act
    actual_value = robot.station

    # assert
    assert_equal(1, actual_value)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2

    # arrange
      robot = Robot.new

      robot.needs_repairs = true
      robot.vintage_model = true

    # act
      actual_value = robot.station
    # assert
      assert_equal(2, actual_value)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3

    # arrange
    robot = Robot.new

    robot.needs_repairs = true
    # act
    actual_value = robot.station
    # assert
    assert_equal(3,actual_value)
  end

  def test_that_robot_in_good_condition_sent_to_station_4

    # arrange
    robot = Robot.new

    robot.needs_repairs = false
    # act
    actual_value = robot.station
    # assert
    assert_equal(4,actual_value)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one

    # arrange
    robot = Robot.new

    # act
    actual_value = robot.prioritize_tasks
    # assert
    assert_equal(-1,actual_value)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value

    # arrange
    robot = Robot.new

    robot.todos = [1]
    # act
    actual_value = robot.prioritize_tasks


    # assert
    assert_equal(1,actual_value)
  end

  def test_workday_on_day_off_returns_false

    # arrange
     robot = Robot.new
     robot.day_off = ("sunday")

    # act
    actual_value = robot.workday?("sunday")
    # assert
    assert_equal(false,actual_value)
  end

  def test_workday_not_day_off_returns_true

    # arrange
     robot = Robot.new
     robot.day_off != "sunday"
    # act
     actual_value = robot.workday?("sunday")
    # assert
    assert_equal(true,actual_value)
  end

end
