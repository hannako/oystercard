require 'journey'

describe Journey do
  subject(:journey) {described_class.new(station)}
  let(:station) { double :station }
  let(:card) { dpuble :oystercard}
  # let(:exit_station) { double :station}
  # let(:journey){ {entry_station: entry_station, exit_station: exit_station}}

  it "knows if a journey is not complete" do
    journey.finish(station)
    expect(journey.complete?).to be true
  end

  it 'charges a penalty fare if incomplete' do
    expect(journey.fare).to eq Journey::PENALTY_FARE
  end

  it "returns itself when exiting a station" do
    expect(journey.finish(station)).to eq(journey)
  end

  context 'given an entry station' do

    it "returns a penalty fare if no exit station given" do
        expect(subject.fare).to eq Journey::PENALTY_FARE
    end
  end

  context 'given an exit station' do

    it 'calculates a fare' do
      journey.finish(station)
      expect(journey.fare).to eq 1
    end

    it "knows if a journey is complete" do
      journey.finish(station)
      expect(journey.complete?).to be true
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
