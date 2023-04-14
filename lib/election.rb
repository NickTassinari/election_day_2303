class Election 
  attr_reader :year, :races, :candidates

  def initialize(year)
    @year = year 
    @races = []
    @candidates = []
  end

  def add_race(race)
    @races << race 
  end

  def add_candidates(candidate)
    @candidates << candidate 
  end

  def vote_counts
    {@candidates[0].name => @candidates[0].votes, @candidates[1].name => @candidates[1].votes}
  end
end