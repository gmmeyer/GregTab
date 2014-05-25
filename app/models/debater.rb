class Debater < ActiveRecord::Base

	belongs_to :team
	belongs_to :school

	has_many :rounds, through: :pairings
	has_many :pairings, through: :team
	has_many :speaker_points
	has_many :ranks
	has_many :wins, through: :rounds
	# ruby operates by convention
	# but also doesn't like weird spelling rules...
	# I find this funny.
	has_many :losses, through: :rounds

	validates :team_id, presence: true
	validates :school_id, presence: true
	validates :name, presence: true

	

end
