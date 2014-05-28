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

			teams = self.tournament.teams.includes(:wins).includes(:losses).includes(rounds: [:judges]).where("wins_count = bracket")

			if teams % 2 == 1

				teams << self.tournament.teams.includes(:wins).includes(:losses).includes(rounds: [:judges]).where("wins_count = ?", bracket - 1).first
			end

			rounds = teams.length / 2


		end


		
	end


end
