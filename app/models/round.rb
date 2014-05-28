class Round < ActiveRecord::Base

	validates :round_number, :tournament_id, :outround, presence: true
	validates :outround, inclusion: { in: [true, false] }

	has_many :pairings
	belongs_to :tournament, counter_cache: true

	def outround?
		@outround
	end

	def pair_round
		prior_rounds_count = self.tournament.rounds_count

		prior_rounds_count.times do |bracket|

			teams = self.tournament.teams.includes(:wins).includes(:losses).includes(rounds: [:judges]).includes(:speaker_points).includes(:ranks).where("wins_count = bracket")
			teams = teams.sort_teams

			if teams % 2 == 1

				if bracket != 0
					teams << self.tournament.teams.includes(:wins).includes(:losses).includes(rounds: [:judges]).where("wins_count = ?", bracket - 1).order("").first
				else
					create_pairing([teams.pop])
				end
			end

			pairings = teams.length / 2

			pairings.times do |pairing|
				create_pairing([teams.pop, teams.shift])
			end
		end

		nil
	end

	def create_pairing(teams)
		pairing = Pairing.create(round_id: self.id)
		if teams.length == 1
			Gov.create(pairing_id: pairing.id, team_id: teams.first.id)
		else
			teams = teams.sort(|a,b| a.govs_count <=> b.govs_count)
			Gov.create(team_id: teams.pop.id, pairing_id: pairing.id)
			Opp.create(team_id: teams.shift.id, pairing_id: pairing.id)
		end

		nil
	end

	def sort_teams(teams)
		teams.sort(|a,b| a.speaker_points.total_speaker_points <=> b.speaker_points.total_speaker_points)
	end


end
