class Round < ActiveRecord::Base

	validates :round_number, :tournament_id, :outround, presence: true
	validates :outround, inclusion: { in: [true, false] }

	has_many :pairings
	belongs_to :tournament, counter_cache: true

	def outround?
		@outround
	end

	def pair_round

		rounds = self.tournament.rounds_count

		rounds.times do |bracket|

			teams = self.tournament.teams.where("wins_count = bracket").includes(:wins).includes(:losses).includes(rounds: [:judges])

		end


		
	end


end
