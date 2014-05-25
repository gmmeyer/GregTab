class PairingMember < ActiveRecord::Base
	belongs_to :pairing
	belongs_to :team
end
