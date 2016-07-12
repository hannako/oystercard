require 'oystercard'

describe Oystercard do
  
  describe 'Oystercard transactions' do
    
    it 'balance' do
    expect(subject).to respond_to :balance
    end
  
end
end