class Oystercard

  MAX_LIMIT = 90
  MINIMUM_BALANCE = 1
  FARE = 1

  attr_accessor :balance, :in_journey, :entry_station
  attr_reader :journeys

  def initialize
    @balance = 0
    @journeys = {}

  end

  def top_up(money)
    fail "Maximum balance of £#{MAX_LIMIT} exceeded" if full? money
    self.balance += money
  end

  def touch_in(entry_station)
    fail "Insufficient funds" if balance < MINIMUM_BALANCE
    @entry_station = entry_station
    journeys[:key] = entry_station

  end

  def touch_out(exit_station)
    deduct(FARE)
    @entry_station = nil
    journeys[:exit] = exit_station
  end

  def in_journey?
    !@entry_station.nil?

  end

private

  def full? top_up_amount
    self.balance + top_up_amount > 90
  end

  def deduct(fare)
    self.balance -= fare
  end

end
