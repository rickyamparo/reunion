require './lib/activity'

class Reunion

  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
    @total = 0
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.each do |activity|
      @total += activity.total_cost
    end
    @total
  end

end
