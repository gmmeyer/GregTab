class Judge < ActiveRecord::Base

	has_many :scratches
	has_many :rounds, through: :pairings
	has_many :pairings
	has_many :schools

	has_many :affiliations, as: :affiliatable, inverse_of: :affiliatable, dependent: :destroy


end
