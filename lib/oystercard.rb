require_relative 'journey'

class Oystercard

  MAX_LIMIT = 90
  MINIMUM_BALANCE = 1
  FARE = 1

  attr_accessor :balance, :journey

  def initialize# ( journey = Journey.new)
    @balance = 0
    @journeys = {}
    # @journey = journey
  end

  def top_up(money)
    fail "Maximum balance of £#{MAX_LIMIT} exceeded" if full? money
    self.balance += money
  end

  def touch_in
    fail "Insufficient funds" if balance < MINIMUM_BALANCE
    Journey.new
  end

  def touch_out
    deduct(FARE)
    # journey.finish
  end



private

  def full? top_up_amount
    self.balance + top_up_amount > 90
  end

  def deduct(fare)
    self.balance -= fare
  end

end
