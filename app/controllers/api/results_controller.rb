module Api
  class ResultsController < ApiController

    def add_speaker_points(debater, points)
      debater.speaker_points.create(pairing_id: result.id, judge_id: self.pairing.judge.id, result_id: result.id)
    end

    def add_ranks(debater, rank)
      debater.speaker_points.create(pairing_id: self.pairing.id, judge_id: self.pairing.judge.id, result_id: result.id)
    end

  end
end
