class Loss < Result

	belongs_to :team, counter_cache: true

	def initialize
		@type = 0
	end
	
end