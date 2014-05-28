class PairingMember < ActiveRecord::Base
	validaets :pairing_id, :team_id, presence: true
	validates :side, presence: true

	# Do not use this. Use one of the classes that inherits from it.

	def initialize
		raise("Use gov or opp. Do not use pairing member directly.")
	end

	belongs_to :pairing
	belongs_to :team
end
