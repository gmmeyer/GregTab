class School < ActiveRecord::Base
	has_many :debaters, through: :affiliations
	has_many :teams, through: :debaters
	has_many :judges, through: :affiliations
	has_many :affiliations, inverse_of: :school, dependent: :destroy
end
