require_relative "journey"

class Oystercard

  MAX_LIMIT = 90
  MINIMUM_BALANCE = 1
  ONE_JOURNEY_FARE = 1
  PENALTY_FARE = 6

  attr_accessor :balance, :journey :journies

  def initialize()
    @balance = 0
  end

  def top_up(money)
    fail "Maximum balance of £#{MAX_LIMIT} exceeded" if full? money
    self.balance += money
  end

  def touch_in(entry_station)
    fail "Insufficient funds" if balance < MINIMUM_BALANCE
    @journey = Journey.new(entry_station)

  end

  def touch_out(exit_station)
    journey.finish(exit_station)

    deduct_fare
  end

  # def store_journey
  #   @journeys = [entry_station: entry_station, exit_station: exit_station]
  # end

  def full? top_up_amount
    self.balance + top_up_amount > 90
  end

  def deduct_fare
    if journey.incomplete?
      self.balance -= PENALTY_FARE
      puts " penalty #{self.balance}"
    else
      self.balance -= ONE_JOURNEY_FARE
      puts " normal #{self.balance}"
    end
  end

end
