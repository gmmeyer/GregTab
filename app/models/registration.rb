class Registration < ActiveRecord::Base

	ROLES = {
		1 => :debater,
		2 => :judge
	}

	ROLE_IDS = ROLES.invert

	belongs_to :tournament, inverse_of: :registrations, counter_cache: true 
	belongs_to :registerable, inverse_of: :registrations, polymorphic: true, counter_cache: true

	validates :tournament_id, :team_id, presence: true
	validates :role_id, inclusion: { in: ROLES.keys }
	validates :registerable, :school, presence: true

	scope :role, ->(role_name) { where(role_id: ROLE_IDS[role_name] )}


	def role_name
		ROLES[self.role_id]
	end 
	
end
