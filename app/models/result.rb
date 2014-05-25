class Result < ActiveRecord::Base
	belongs_to :pairing
	belongs_to :team
	validates :type, :team_id, :pairing_id, presence: true
	validates :type, uniqueness: {scope: :pairing_id}
	has_many :speaker_points
	has_many :ranks

end
