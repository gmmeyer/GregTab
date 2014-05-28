class PairingMember < ActiveRecord::Base
	validaets :pairing_id, :team_id, presence: true

	belongs_to :pairing
	belongs_to :team
end
