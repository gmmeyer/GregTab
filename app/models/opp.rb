class Opp < PairingMember

	belongs_to :team, counter_cache: true

	def initialize
		self.side_type = 1
	end

end