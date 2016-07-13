require 'oystercard'

describe Oystercard do
  minimum_balance = Oystercard::MINIMUM_BALANCE
  fare = Oystercard::FARE

  let(:station) { double :station }
  let(:entry_station) {double :station}
  let(:exit_station) {double :station}


  describe 'Oystercard transactions' do

    it 'balance' do
      expect(subject).to respond_to :balance
    end

    it 'has an upper limit' do
      max_limit = Oystercard::MAX_LIMIT
      subject.top_up max_limit
        expect{ subject.top_up 1 }.to raise_error "Maximum balance of £#{max_limit} exceeded"
    end

  describe ' Journey ' do

    it 'allows touch in' do
      subject.top_up(fare)
      subject.touch_in(station)
        expect(subject.in_journey?).to eq true
    end

    it 'refuses touch in if balance low' do
      expect{subject.touch_in(station)}.to raise_error "Insufficient funds"
    end

    it 'allows touch out' do
      subject.touch_out(exit_station)
        expect(subject.in_journey?).to eq false
    end

   it 'deducts fare from balance' do
     subject.balance = minimum_balance
      expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by (-1)
   end

   it 'remembers the entry station when touches in' do
     subject.top_up(minimum_balance)
     subject.touch_in(station)
      expect(subject.entry_station).to eq station
   end

  end

  describe 'provides travel information' do

    it 'starts with no journey history' do
      expect(subject.journeys).to be_empty
    end


    it 'stores journey details' do
      subject.top_up(minimum_balance)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
        expect(subject.journeys).to include( entry_station => exit_station )
    end




  end
end
end
