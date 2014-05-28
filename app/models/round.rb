class Round < ActiveRecord::Base
	has_many :pairings
	belongs_to :tournament

	def pair_round
		
	end


end
