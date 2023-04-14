class Race 
  attr_reader :office, :candidates, :open  

  def initialize(office)
    @office = office 
    @candidates = []
    @open = true 
  end

  def register_candidate!(candidate_info)
    candidate = Candidate.new(candidate_info)
    @candidates << candidate
    candidate 
  end

  def open? 
    @open 
  end

  def close! 
    @open = false 
  end

  def winner 
    if open? 
      false  
    elsif  
      @candidates[0].votes > @candidates[1].votes 
      @candidates[0]
    elsif  
      @candidates[0].votes < @candidates[1].votes 
      @candidates[1]
    else  
      "WE WANT A VOTE RECALL THIS THING WAS RIGGED!!"
    end
  end
end