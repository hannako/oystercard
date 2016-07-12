require 'oystercard'

describe Oystercard do

  describe 'Oystercard transactions' do

    it 'balance' do
    expect(subject).to respond_to :balance
    end

    it 'tops up' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

end
end
