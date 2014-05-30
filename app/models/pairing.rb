class Pairing < ActiveRecord::Base
  validates :round_id, presence: true

  has_many :wins
  has_many :losses

  has_many :speaker_points
  has_many :ranks

  has_one :gov
  has_one :opp

  has_one :gov_team, through: :gov, source: :team
  has_one :opp_team, through: :opp, source: :team
end
