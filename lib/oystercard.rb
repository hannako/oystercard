class Oystercard

  MAX_LIMIT = 90
  MINIMUM_BALANCE = 1

  attr_accessor :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
    
  end

  def top_up(money)
    fail "Maximum balance of £#{MAX_LIMIT} exceeded" if full? money
    self.balance += money
  end

  def deduct(fare)
    self.balance -= fare
  end

  def touch_in
    fail "Insufficient funds" if balance < MINIMUM_BALANCE
    self.in_journey = true
  end

  def touch_out
    self.in_journey = false
  end

  def in_journey?
    in_journey
  end


  private

  def full? top_up_amount
    self.balance + top_up_amount > 90
  end

end
