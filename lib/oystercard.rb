require_relative 'station'
require_relative 'journey'

class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_FARE = 1


attr_reader :entry_station, :exit_station, :balance, :journeys

  def initialize
     @balance = 0
     #@entry_station = nil
     #@exit_station = nil
     @journeys = []
     @journey = Journey.new
  end

  def top_up(amount)
    raise "Balance has exceeded limit of #{LIMIT}" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Insufficient funds" if @balance < MINIMUM_BALANCE
    @journeys << { entry_station: entry_station }
    @journey.start(entry_station)
    #@entry_station = entry_station
    deduct(@journey.fare)
  end

  def touch_out(exit_station)
    @journeys.last[:exit_station] = exit_station
    #@entry_station = nil
    @journey.finish(exit_station)
    #@exit_station = exit_station
    deduct(@journey.fare)
  end

  def in_journey?
    @journey.started?
    #return false if @entry_station == nil
    #true if @entry_station == entry_station
    #false
  end

  private

    def deduct(fare)
      @balance -= fare
    end

end
