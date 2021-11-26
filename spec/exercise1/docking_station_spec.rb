require 'docking_station'

describe DockingStation do
  let(:working_bike) { double("bike", working?: true) }
  let(:broken_bike) { double("bike", working?: false) }
  # @bikes = Array.new

  describe '#working_bike_count' do
    context '1 working bike' do
      it "returns 1" do
        docking_station = DockingStation.new([working_bike])

        expect(docking_station.working_bike_count).to eq(1)
      end
    end

    context '1 working bike, 1 broken bike' do
      it "returns 1" do
        docking_station = DockingStation.new([working_bike, broken_bike])

        expect(docking_station.working_bike_count).to eq(1)
      end
    end
  end

  describe '#random_bike_working?' do
    context 'random bike is working' do
      it 'returns true' do
        docking_station = DockingStation.new([working_bike, broken_bike])

        allow_any_instance_of(Array).to receive(:sample).and_return(working_bike)

        expect(docking_station.random_bike_working?).to eq(true)
      end
    end

    context 'random bike is broken' do
      it 'returns false' do
        docking_station = DockingStation.new([working_bike, broken_bike])

        allow_any_instance_of(Array).to receive(:sample).and_return(broken_bike)

        expect(docking_station.random_bike_working?).to eq(false)
      end
    end
  end
end