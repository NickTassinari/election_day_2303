class Election 
  attr_reader :year, :races  

  def initialize(year)
    @year = year 
    @races = []
    @vote_counts = {}
  end

  def add_race(race)
    @races << race 
  end

  def candidates 
    @races.flat_map do |race| 
      race.candidates 
    end
  end

  def vote_counts 
    candidates.map { |candidate| [candidate.name, candidate.votes] }.to_h

  end
  # def vote_counts
  #   add_votes
  #   @vote_counts
  # end

  # def add_votes
  #   candidates.each do |candidate|
  #     @vote_counts[candidate.name] = candidate.votes 
  #   end
  # end
end