class Debater < ActiveRecord::Base

	belongs_to :team
	belongs_to :school

	has_many :rounds, through: :pairings
	has_many :pairings, through: :team
	has_many :speaker_points
	has_many :ranks

	validates :team_id, presence: true
	validates :school_id, presence: true
	validates :name, presence: true

	

end
