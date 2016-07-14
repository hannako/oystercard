class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_accessor :entry_station, :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
  end

  def finish(exit_station = nil)
    @exit_station = exit_station
    self
  end

  # def store_journey
  #   @journeys = [entry_station: entry_station, exit_station: exit_station]
  # end
  #
  # def in_journey?
  #   !@entry_station.nil?
  # end

  def complete?
    (@exit_station != nil) && (@entry_station != nil)
  end

  def fare
    if complete?
      MINIMUM_FARE
    else
      PENALTY_FARE
  end
end
end
