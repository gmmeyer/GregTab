class Team < ActiveRecord::Base
	attr_accessor :team_1_count

	has_many :debaters
	has_many :schools, through: :debaters
	has_many :speaker_points, through: :debaters
	has_many :ranks, through: :debaters
	has_many :rounds, through: :pairings
	has_many :pairings, through: :pairing_memberships
	has_many :pairing_memberships

end
