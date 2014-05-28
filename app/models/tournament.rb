class Tournament < ActiveRecord::Base
	validates :date, presence: true

	has_many :registrations, inverse_of: :tournament, dependent: :destroy
	has_many :teams, through: :registrations
	has_many :schools, through: :teams
	has_many :debaters, through: :teams
end
