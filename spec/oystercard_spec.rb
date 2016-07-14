require 'oystercard'

describe Oystercard do
  minimum_balance = Oystercard::MINIMUM_BALANCE
  fare = Oystercard::FARE

  subject(:card) {described_class.new}
  let(:station) { double :station }

  describe 'Oystercard transactions:' do

    it 'has an upper limit' do
      max_limit = Oystercard::MAX_LIMIT
      subject.top_up max_limit
        expect{ card.top_up 1 }.to raise_error "Maximum balance of £#{max_limit} exceeded"
    end

    it 'can be touched in' do
      card.top_up(minimum_balance)
      card.touch_in :station
      expect(card.entry_station).to eq :station
    end

    it 'refuses touch in if balance low' do
      expect{card.touch_in(:station)}.to raise_error "Insufficient funds"
    end

   it 'deducts fare from balance' do
     card.balance = minimum_balance
      expect { card.touch_out(:station) }.to change{ card.balance }.by (-1)
   end

  end
end
