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


  # Move this to the controller.
  # Speaks: gov 1, gov 2, opp 1, opp 2
  # Ranks: same as above
  def create_win(team)
    team.wins.new(pairing_id: self.id)
  end

  def create_loss(team)
    team.losses.new(pairing_id: self.id)
  end

  def double_loss
    [
      gov.losses.new(pairing_id: self.id),
      opp.losses.new(pairing_id: self.id)
    ]
  end

end
