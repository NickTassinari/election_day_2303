class Candidate
  attr_reader :name, :party, :attributes, :votes   

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @party = attributes.fetch(:party)
    @votes = 0
  end

  def vote_for!
    @votes += 1 
  end
end