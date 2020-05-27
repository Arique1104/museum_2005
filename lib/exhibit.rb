class Exhibit
  attr_reader :name,
              :cost


 def initialize(exhibit_deets)
    @name = exhibit_deets[:name]
    @cost = exhibit_deets[:cost]
 end
end
