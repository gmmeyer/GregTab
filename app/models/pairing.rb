class Pairing < ActiveRecord::Base
	validates :round_id, presence: true

	has_many :pairing_memberships
	has_one :win
	has_one :loss
	has_many :results

end
