require 'journey'

describe Journey do
  subject(:journey) {described_class.new(station)}
    let(:station) { double :station, zone: 1}

  it 'has a penalty fare by default' do
     expect(journey.fare).to eq Journey::PENALTY_FARE
  end

  it 'knows if a journey is not complete' do
    expect(subject).not_to be_complete
  end

  context 'given an entry station' do
    subject {described_class.new(station)}

    it 'has an entry station' do
      expect(subject.entry_station).to eq station
    end

    it "returns a penalty fare if no exit station given" do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
  end

  context 'given an exit station' do

       before do
         subject.finish(exit_station)
       end

       it 'calculates a fare' do
         expect(subject.fare).to eq 1
       end

       it "knows if a journey is complete" do
         expect(subject).to be_complete
       end
  end

  describe '#start_journey' do
    it 'should start a journey' do
      station = Station.new("Bank", 1)
      expect(journey.start(station)).to eq(journey.entry_station)
    end
  end

  describe '#end_journey' do
    it 'should end a journey' do
      station = Station.new("Shoreditch", 1)
      expect(journey.finish(station)).to eq(journey)
    end

  end

end
