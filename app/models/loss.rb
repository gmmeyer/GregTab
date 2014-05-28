class Loss < Result

	belongs_to :team, counter_cache: true

	def initialize
		self.type = 0
	end
	
end