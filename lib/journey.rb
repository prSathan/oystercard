require_relative 'station'

class Journey

PENALTY_FARE = 6
MINIMUM_FARE = 1

attr_accessor :entry_station, :exit_station

  def initialize(station = nil)
    @entry_station = station
    @exit_station = nil
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
    self
  end

  def fare
    return PENALTY_FARE if started? && !complete?
    return MINIMUM_FARE if started? && complete?
  end

  def started?
    @entry_station != nil
  end

  def complete?
    @entry_station && @exit_station
  end

end
