class Rank < ActiveRecord::Base
	validates :rank, uniqueness: {scope: :pairing}
	validates :pairing_id, :debater_id, :judge_id, :result_id, presence: true

	belongs_to :debater
	belongs_to :result
	belongs_to :judge
	belongs_to :pairing

	# make sure this works
	def self.total_ranks
		ranks.sum(:rank)
	end
end
