class Pairing < ActiveRecord::Base
	validates :round_id, presence: true

	has_many :pairing_memberships
	has_many :speaker_points
	has_many :ranks
	has_one :win
	has_one :loss
	has_many :results

end
