class UsPresidents::Details
  
  attr_accessor :birth_date, :death_date, :religion, :political_party, :nickname
  
  @@all = []
  
  def initialize(birth_date, death_date, religion, political_party, nickname)
    @birth_date = birth_date
    @death_date = death_date
    @religion = religion
    @political_party = political_party
    @nickname = nickname
    @@all << self 
  end
  
  def self.all
    @@all 
  end
  
  
end