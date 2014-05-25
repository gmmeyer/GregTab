class Rank < ActiveRecord::Base
	validates :rank, uniqueness: {scope: :pairing}
	validates :pairing_id, :debater_id, :judge_id, presence: true

	belongs_to :debater
	belongs_to :result
	belongs_to :pairing, through: :result
end
