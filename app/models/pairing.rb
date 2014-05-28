class Pairing < ActiveRecord::Base
	validates :round_id, presence: true

	has_many :pairing_memberships
	has_many :teams, through: :pairing_memberships
	has_one :win
	has_many :losses
	has_many :results
	has_one :gov, through: 

end