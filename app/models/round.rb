class Round < ActiveRecord::Base

  validates :round_number, :tournament_id, :outround, presence: true
  validates :outround, inclusion: { in: [true, false] }

  has_many :pairings
  belongs_to :tournament, counter_cache: true

  def outround?
    @outround
  end

  # All of this logic should be moved to the controller.
  # And a route should be made for it.
  # The best part is that it can be a get route. :)

  def pair_round
    prior_rounds_count = self.tournament.rounds_count

    prior_rounds_count.times do |bracket|

      teams = self.tournament.teams.includes(:wins).includes(:losses).includes(rounds: [:judges]).includes(:speaker_points).includes(:ranks).where("wins_count = bracket")
      teams = teams.sort_teams

      if teams % 2 == 1
        # Are there an odd number of teams in the bracket?
        if bracket != 0
          # If this isn't the bottom bracket,
          # add the bottom team from the lower bracket to this one.
          teams << self.tournament.teams.includes(:wins).includes(:losses).includes(rounds: [:judges]).where("wins_count = ?", bracket - 1).order("").last
        else
          # If it is the bottom bracket, give the bottom team the bye.
          create_pairing([teams.pop])
        end
      end

      pairings = teams.length / 2

      pairings.times do |pairing|
        create_pairing([teams.pop, teams.shift])
      end
    end

    nil
  end

  def create_pairing(teams)
    pairing = Pairing.create(round_id: self.id)
    if teams.length == 1
      Gov.create(pairing_id: pairing.id, team_id: teams.first.id)
      teams.first.recieved_bye == true
      teams.first.save
    else
      teams = teams.sort(|a,b| a.govs_count <=> b.govs_count)
      Gov.create(team_id: teams.pop.id, pairing_id: pairing.id)
      Opp.create(team_id: teams.shift.id, pairing_id: pairing.id)
    end

    nil
  end

  def sort_teams(teams)
    teams.sort(|a,b| a.speaker_points.total_speaker_points <=> b.speaker_points.total_speaker_points)
  end


end
