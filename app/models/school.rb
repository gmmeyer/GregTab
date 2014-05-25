class School < ActiveRecord::Base
	has_many :debaters
	has_many :teams
end
