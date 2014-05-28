class Win < Result

	belongs_to :team, counter_cache: true

	def initialize
		self.type = 1
	end

end