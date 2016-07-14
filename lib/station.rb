class Station

  attr_reader :name, :zone

  def initialize(name: "oval",zone: 3)
    @name = name
    @zone = zone
  end
end
