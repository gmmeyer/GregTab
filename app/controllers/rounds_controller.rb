class RoundsController < ApplicationController

  def new
    @round = Round.new
  end

  def create
    @round = Round.new(round_params)
    if @round.save
      pair_round
      redirect_to round_url
    else
      flash[:errors] = @round.errors.full_messages
      render :new
    end
  end

  def update
  end

  def show
  end

  def delete
  end

  private
  def round_params
    params.require(:round).permit(:tournament_id, :round_number, :outround)
  end

  # pairing logic

  def pair_round
    prior_rounds_count = @round.tournament.rounds_count
    pair_by_bracket(prior_rounds_count)
    assign_judges
    nil
  end

  def assign_judges
    pairings = @round.pairings.order("pairing_rank DESC")
    # refactor this once a mechanism for judge check-in is designed
    judges = @round.tournament.judges.order("rank DESC").all
    until pairings.empty
      pairing = pairings.shift
      judges.each do |judge|
        if judge.can_judge(pairing)
          pairing.judge_id = judge.id
          pairing.save
          break
        end
      end
    end

    nil
  end

  def pair_by_bracket(prior_rounds_count)
    bracket = prior_rounds_count

    while bracket >= 0
      teams = @round.tournament.teams.includes(:wins)
                        .includes(:losses).includes(rounds: [:judges])
                        .includes(:speaker_points).includes(:ranks)
                        .order("speaker_points.speaker_points DESC")
                        .where("wins_count = bracket")

      teams = teams.sort_teams
      teams = pullup_or_bye(teams, bracket)
      pairings = teams.length / 2

      pairings.times do |pairing|
        create_pairing([teams.pop, teams.shift], bracket)
      end

      bracket -= 1
    end

    nil
  end

  def pullup_or_bye(teams, bracket)
    if teams % 2 == 1
      # Are there an odd number of teams in the bracket?
      if bracket != 0
        # If this isn't the bottom bracket,
        # add the bottom team from the lower bracket to this one.

        # how do you do selection within it while maintaining ordering?
        teams << @round.tournament.teams.includes(:wins)
                            .includes(:losses).includes(rounds: [:judges])
                            .where("wins_count = ?", bracket - 1)
                            .order("speaker_points.speaker_points DESC").last

      else
        # If it is the bottom bracket, give the bottom team the bye.
        create_pairing([teams.pop])
      end
    end

    teams
  end

  def create_pairing(teams, bracket)
    pairing = Pairing.create(round_id: @round.id, pairing_rank: bracket)

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
    teams.sort(|a,b| a.speaker_points.total_speaker_points <=> 
                                 b.speaker_points.total_speaker_points)
  end

  def order_teams(teams)

    # refactor this, pulling them all and then sorting them.

  end

end