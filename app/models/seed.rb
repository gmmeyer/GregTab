class Seed < ActiveRecord::Base

	validates :seed_type, :debater_id, presence: true
	validates :seed_type, inclusion: { in: (0..1) }

	belongs_to :debater



end
