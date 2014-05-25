class Scratch < ActiveRecord::Base
	belongs_to :judge
	belongs_to :team

	def self.create_affiliation_scratches(judge, school)
	end

end
