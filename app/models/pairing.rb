class Pairing < ActiveRecord::Base
	validates :team_1_id, presence: true
	validates :team_2_id, presence: true

	belongs_to :team_1, class_name: "Team"
	belongs_to :team_2, class_name: "Team"

end
