class PairingsController < ApplicationController


  


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
