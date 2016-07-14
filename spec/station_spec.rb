require 'station'

  describe Station do

    subject {described_class.new(name:"Old Street",zone:1)}

    it 'knows what its name is' do
      expect(subject.name).to eq "Old Street"
    end

    it'knows what zone it is in' do
      expect(subject.zone).to eq 1

    end

  end
