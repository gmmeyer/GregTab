class Rank < ActiveRecord::Base
	validates :rank, uniqueness: {scope: :pairing_id}

	belongs_to :debater
	belongs_to :round
end
