class Rank < ActiveRecord::Base
	validates :rank, uniqueness: {scope: :pairing_id}
end
