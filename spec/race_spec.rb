require './lib/candidate'
require './lib/race'

RSpec.describe Race do 
  describe '#initialize' do 
    it 'exists and has readable attributes' do 
      race = Race.new("Texas Governor")

      expect(race).to be_a(Race)
      expect(race.office).to eq("Texas Governor")
    end
  end

  describe '#register_candidate!' do 
    it 'can register candidate with attributes' do 
      race = Race.new("Texas Governor")

      expect(race.candidates).to eq([])
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      expect(race.candidates).to eq([candidate1])
      expect(candidate1.class).to eq(Candidate)
      
      expect(candidate1.name).to eq("Diana D")
      expect(candidate1.party).to eq(:democrat)

      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})

      expect(race.candidates).to eq([candidate1, candidate2])
    end
  end

  describe '#open?/#close!' do 
    it 'can tell if election is open? and then close it' do 
      race = Race.new("Texas Governor")

      expect(race.open?).to eq(true)

      race.close! 

      expect(race.open?).to eq(false)
    end
  end

  describe '@winner' do 
    it 'can return the candidate with the most votes or a tie' do 
    election = Election.new("2024") 
    race = Race.new("Texas Governor")
    candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
    candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})

    election.add_candidates(candidate1)
    election.add_candidates(candidate2)
    candidate1.vote_for!
    candidate1.vote_for!
    candidate2.vote_for!
    race.close! 
    expect(race.winner).to eq(candidate1)
  end
end
end