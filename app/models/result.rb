class Result < ActiveRecord::Base
	belongs_to :pairing
	belongs_to :team
	has_many :speaker_points
	has_many :ranks

	validates :type, :team_id, :pairing_id, presence: true
	validates :type, uniqueness: {scope: :pairing_id}
	validate :check_scores

	def initialize
		raise("Use win or loss. Do not use result directly")
	end


	def check_scores
		add.errors("You must include the ranks before saving the result") if self.ranks.length != 4
		add.errors("You must include the speaker  before saving the result") if self.speaker_points.length != 4
	end

end
