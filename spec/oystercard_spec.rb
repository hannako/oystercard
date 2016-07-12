require 'oystercard'

describe Oystercard do
  minimum_balance = Oystercard::MINIMUM_BALANCE

  describe 'Oystercard transactions' do

    it 'balance' do
    expect(subject).to respond_to :balance
    end

    it 'tops up' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it 'has an upper limit' do
      max_limit = Oystercard::MAX_LIMIT
      subject.top_up max_limit
      expect{ subject.top_up 1 }.to raise_error "Maximum balance of £#{max_limit} exceeded"
    end

    it 'allows you to deduct from the balance' do
      subject.top_up(10)
      fare = 5
      expect{ subject.deduct(3) }.to change{ subject.balance }.by -3
    end
  end

  describe ' Journey ' do

    it 'allows touch in' do
      expect(subject).to respond_to :touch_in
    end
    
    it 'refuses touch in if balance low' do
      expect{subject.touch_in}.to raise_error "Insufficient funds"
    end

    it ' verifies journey' do
      subject.balance = minimum_balance
      subject.touch_in
      expect(subject.in_journey).to eq true
    end

    it 'responds with journey status' do
      expect(subject.in_journey?).to eq false
    end

   it 'allows touch out' do
     subject.in_journey = true
     subject.touch_out
     expect(subject.in_journey).to eq false
   end

  end
end
