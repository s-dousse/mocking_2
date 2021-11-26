require 'docking_station'

class MockWorkingBike
  def working?
    true
  end
end

class MockBrokenBike
  def working?
    false
  end
end

describe DockingStation do
  describe '#working_bike_count' do
    before do
      @bikes = []
    end

    context '1 working bike' do
      it "returns 1" do
        
        @bikes << MockWorkingBike.new
        docking_station = DockingStation.new(@bikes)

        expect(docking_station.working_bike_count).to eq(1)
      end
    end

    context '1 working bike, 1 broken bike' do
      it "returns 1" do
        @bikes << MockWorkingBike.new
        @bikes << MockBrokenBike.new
        docking_station = DockingStation.new(@bikes)

        expect(docking_station.working_bike_count).to eq(1)
      end
    end
  end

  describe '#random_bike_working?' do
    before do
        @bikes = []
        @working_bike = MockWorkingBike.new
        @broken_bike = MockBrokenBike.new
      end

    context 'random bike is working' do
      it 'returns true' do
        docking_station = DockingStation.new([@working_bike, @broken_bike])
        allow_any_instance_of(Array).to receive(:sample).and_return(@working_bike)
        expect(docking_station.random_bike_working?).to eq(true)
      end
    end

    context 'random bike is broken' do
      it 'returns false' do
        working_bike = MockWorkingBike.new
        broken_bike = MockBrokenBike.new

        docking_station = DockingStation.new([working_bike, broken_bike])
        allow_any_instance_of(Array).to receive(:sample).and_return(@broken_bike)
        expect(docking_station.random_bike_working?).to eq(false)
      end
    end
  end
end
