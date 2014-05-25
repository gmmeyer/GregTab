class Pairing < ActiveRecord::Base
	validates :round_id, presence: true

	has_many :team_memberships

end
