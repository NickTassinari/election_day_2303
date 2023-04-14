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
end