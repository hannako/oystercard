require 'journey'
require 'oystercard'

describe Journey do
  let(:station) { double :station, zone: 1 }

  # let(:entry_station) { double :station }
  # let(:exit_station) { double :station}
  # let(:journey){ {entry_station: entry_station, exit_station: exit_station}}

  it "knows if a journey is not complete" do
    expect(subject).not_to be_complete
  end

  it 'has a penalty fare by default' do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  it "returns itself when exiting a journey" do
    expect(subject.finish(station)).to eq(subject)
  end

context 'given an entry station' do
  subject {described_class.new(entry_station: station)}

  it 'has an entry station' do
    expect(subject.entry_station).to eq station
  end

  it "returns a penalty fare if no exit station given" do
      expect(subject.fare).to eq Journey::PENALTY_FARE
  end
end

context 'given an exit station' do
  let(:other_station) { double :other_station }

  before do
    subject.finish(other_station)
  end

  it 'calculates a fare' do
    expect(subject.fare).to eq 1
  end

  it "knows if a journey is complete" do
    expect(subject).to be_complete
  end
end

  # describe '#start' do
  #   it 'knows where the journey began' do
  #     expect(subject.start(entry_station)).to eq entry_station
  #   end
  # end

  # describe '#finish' do
  #   it 'knows where the journey ends' do
  #     expect(subject.finish(exit_station)).to eq exit_station
  #   end
  # end

  # describe 'records a journey' do
  #   it 'starts with no journey history' do
  #     expect(subject.journeys).to be_empty
  #   end
  #
  #   it 'stores journey details' do
  #     subject.start(entry_station)
  #     subject.finish(exit_station)
  #     expect(subject.store_journey).to include journey
  #   end
  # end

end
