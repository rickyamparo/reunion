class Activity

  attr_reader :name, :participants, :total_cost, :owed

  def initialize(name)
    @name = name
    @participants = {}
    @total_cost = 0
    @owed = who_owes_what
  end

  def add_participant(name, money)
    @participants[name] = money
    @total_cost += money
  end

  def split
    @total_cost/@participants.length
  end

  def who_owes_what
    @participants.map do |person, money|
      @participants[person] = split - money
    end
  end

end
