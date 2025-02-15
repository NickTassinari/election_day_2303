require './lib/election'
require './lib/candidate'
require './lib/race'

RSpec.describe Election do 
  describe '#initialize' do 
    it 'exists and has readable attributes' do 
      election = Election.new("2024")

      expect(election).to be_a(Election)
      expect(election.year).to eq("2024")
    end
  end

  describe '#races' do 
    it 'has an array of race objects' do 
      election = Election.new("2024")
      race = Race.new("Texas Governor")

      expect(election.races).to eq([])
    end

    it 'can add races to an array' do 
      election = Election.new("2024")
      race = Race.new("Texas Governor")

      election.add_race(race)

      expect(election.races).to eq([race])

      race2 = Race.new("Colorado Senator")
      election.add_race(race2)

      expect(election.races).to eq([race, race2])
    end
  end

  describe '#candidates' do 
    it 'has an array of candidate objects' do 
      election = Election.new("2024")
      race = Race.new("Texas Governor")
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      election.add_race(race)
      expect(election.candidates).to eq([candidate1, candidate2])
    end
  end

  describe '#vote_counts' do 
    it 'has a hash with candidates name as key and count of votes as value' do 
      election = Election.new("2024")
      race = Race.new("Texas Governor")
      candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
      election.add_race(race)
      # election.add_candidates(candidate1)
      # election.add_candidates(candidate2)

      candidate1.vote_for!
      candidate1.vote_for!
      candidate2.vote_for!

      expect(election.vote_counts).to eq({"Diana D"=>2, "Roberto R"=>1})
    end
  end

  # describe '#winners' do 
  #   it 'has an array of candidate objects that represent the winner of each race' do 
  #     election = Election.new("2024") 
  #     race = Race.new("Texas Governor")
  #     candidate1 = race.register_candidate!({name: "Diana D", party: :democrat})
  #     candidate2 = race.register_candidate!({name: "Roberto R", party: :republican})
  
  #     election.add_candidates(candidate1)
  #     election.add_candidates(candidate2)
  #     candidate1.vote_for!
  #     candidate1.vote_for!
  #     candidate2.vote_for!
  #     race.close! 

  #     election2 = Election.new("2024.5")
  #     race2 = Race.new("Texas Fool of the year")
  #     candidate3 = race.register_candidate!({name: "Dirty Dan", party: :independant})
  #     candidate4 = race.register_candidate!({name: "No I'm Dirty Dan", party: :socialist})
  #     election2.add_candidates(candidate3)
  #     election2.add_candidates(candidate4)
  #     candidate3.vote_for! 
  #     candidate3.vote_for!
  #     candidate3.vote_for!
  #     candidate4.vote_for!
  #     candidate4.vote_for!
  #     candidate4.vote_for!
  #     candidate4.vote_for!

  #     race2.close! 

  #     expect(election.winners).to eq([candidate1, candidate4])
  #   end
  # end
end