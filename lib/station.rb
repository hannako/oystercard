require 'csv'

class Station

@network = {:oval => 'zone 1', :dalston => 'zone 2', :elephant => 'zone 3', :manorhouse => 'zone 4'}

  def initialize(station_name)
    @network
    @station = station_name.to_sym
  end

  def zone?
    @stations[@station]
  end




end
