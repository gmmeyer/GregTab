class SpeakerPoint < ActiveRecord::Base
	validates :result_id, :pairing_id, :debater_id, :judge_id, :speaker_points, presence: true
	
	belongs_to :debater
	belongs_to :result
	belongs_to :judge
	belongs_to :pairing

	# make sure this works
	def self.total_speaker_points
	  speaker_points.sum(:speaker_points)
	end
end
