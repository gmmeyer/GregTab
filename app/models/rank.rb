class Rank < ActiveRecord::Base
	validates :rank, uniqueness: {scope: :pairing_id}
	validates :pairing_id, :debater_id, :judge_id, presence: true

	belongs_to :debater
	belongs_to :pairing
end
