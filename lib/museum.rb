class Museum
attr_reader :name,
            :exhibits,
            :patrons

 def initialize(name)
   @name = name
   @exhibits = []
   @patrons = []

 end

 def add_exhibit(exhibit_param)
   @exhibits << exhibit_param
 end

 def recommend_exhibits(patron_param)
  @recommended = []
  @patron_interest = patron_param.interests

  @patron_interest.each do |interest|
    @exhibits.each do |exhibit|
      if interest == exhibit
        @recommended << exhibit
      end
    end
    @recommended
  end
 end

 def admit(patron_param)
   @patrons << patron_param
 end

 def patrons_by_exhibit_interest
   p_b_e = {}

   @exhibits.each do |exhibit|
     p_b_e[exhibit] = []
        @patrons.each do |patron|
            patron.interests.each do |interest|
              if exhibit.name == interest
            p_b_e[exhibit] = patron
          end
        end
      end
      p_b_e
    end


 end

end
