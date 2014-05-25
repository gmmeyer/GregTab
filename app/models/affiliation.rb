class Affiliation < ActiveRecord::Base

	ROLES = {
		1 => :debater,
		2 => :judge
	}

	ROLE_IDS = ROLES.invert

	belongs_to :school, inverse_of: :affiliations, counter_cache: true 
	belongs_to :affiliatable, inverse_of: :affiliations, polymorphic: true, counter_cache: true

	validates :role_id, inclusion: { in: ROLES.keys }
	validates :affiliatable, :school, presence: true

	scope :role, ->(role_name) { where(role_id: ROLE_IDS[role_name] )}


	def role_name
		ROLES[self.role_id]
	end 

end