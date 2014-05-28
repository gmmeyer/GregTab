class Gov < PairingMember

	belongs_to :team, counter_cache: true

	def initialize
		@side_type = 0
	end

end