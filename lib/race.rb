class Race 
  attr_reader :office, :candidates, :open    

  def initialize(office)
    @office = office 
    @candidates = []
    @open = true 
  end 

  def register_candidate!(candidate_info)
    candidate = Candidate.new(candidate_info)
    candidates << candidate 
    candidate 
  end

  def open? 
    @open 
  end

  def close! 
    @open = false 
  end

  def winner 
    return false if open?
    
    @candidates.max_by(&:votes)
  end
end