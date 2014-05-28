class Team < ActiveRecord::Base

	has_many :debaters, dependent: :destroy
	has_many :schools, through: :debaters
	has_many :speaker_points, through: :debaters
	has_many :ranks, through: :debaters
	has_many :rounds, through: :pairings
	has_many :opponents, through: :pairings, source: :teams
	has_many :pairings, through: :pairing_memberships
	has_many :pairing_memberships
	has_many :wins, dependent: :destroy
	has_many :losses, dependent: :destroy
	has_many :seeds, through: :debaters
	has_many :registrations, as: :registerable, inverse_of: :registerable, dependent: :destroy
	has_many :tournaments, through: :registrations, source: :tournament

	has_many :govs
	has_many :opps


end
