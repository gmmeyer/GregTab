class Round < ActiveRecord::Base
	has_many :pairings
	belongs_to :tournament
end
