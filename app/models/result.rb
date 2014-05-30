class Result < ActiveRecord::Base

  belongs_to :pairing
  has_many :speaker_points
  has_many :ranks

  validates :type, :team_id, :pairing_id, presence: true
  validates :type, uniqueness: {scope: :pairing_id}
  validate :check_scores

  def initialize
    raise("Use win or loss. Do not use result directly")
  end


  def check_scores
    if self.ranks.length != 2
      add.errors("You must include the ranks before saving the result")
    end

    if self.speaker_points.length != 2
      add.errors("You must include the speaker points before saving the result")
    end
  end
end
