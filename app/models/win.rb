class Win < Result

	belongs_to :team, counter_cache: true

	def initialize
		@type = 1
	end

end