class SpeakerPoint < ActiveRecord::Base
	validates :pairing_id, :debater_id, :judge_id, presence: true
end
