require_relative 'journey'

class Oystercard

  MAX_LIMIT = 90
  MINIMUM_BALANCE = 1
  FARE = 1

  attr_accessor :balance, :entry_station, :exit_station, :journey

  def initialize()
    @balance = 0

  end

  def top_up(money)
    fail "Maximum balance of £#{MAX_LIMIT} exceeded" if full? money
    self.balance += money
  end

  def touch_in(entry_station)
    fail "Insufficient funds" if balance < MINIMUM_BALANCE
    @entry_station = entry_station
    start_journey
  end

  def touch_out(exit_station)
    deduct(FARE)
    finish_journey(exit_station)
    @exit_station = exit_station
  end

  def start_journey
    @journey = Journey.new(entry_station)
  end

  def finish_journey(station)
    @exit_station = station
    journey.finish
  end

private

  def full? top_up_amount
    self.balance + top_up_amount > 90
  end

  def deduct(fare)
    fare = FARE
    self.balance -= fare
  end

end
