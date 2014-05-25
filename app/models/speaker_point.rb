class SpeakerPoint < ActiveRecord::Base
	validates :pairing_id, :debater_id, :judge_id, presence: true
	belongs_to :debater
	belongs_to :result
	belongs_to :judge
end
