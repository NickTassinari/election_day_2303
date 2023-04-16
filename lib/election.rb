class Election 
  attr_reader :year, :races, :candidates, :winners 

  def initialize(year)
    @year = year 
    @races = []
    @winners = []
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
    add_votes
    @vote_counts
  end

  def add_votes 
    candidates.each do |candidate|
      @vote_counts[candidate.name] = candidate.votes 
    end
  end
  # def winner_winner
    
  #   @winners << @race.winner 
  # end
end