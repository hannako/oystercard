class Journey


  attr_accessor :entry_station, :exit_station, :journies

  def initialize(entry_station = :no_touch_in, exit_station = :no_touch_out)
    @entry_station = entry_station
    @exit_station = exit_station
    @journey = []

  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  def incomplete?
    (entry_station == :no_touch_in) || (exit_station == :no_touch_out)
  end

end



  # def in_journey?
  #   !@entry_station.nil?
  # end
