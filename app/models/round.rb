class Round < ActiveRecord::Base

  validates :round_number, :tournament_id, :outround, presence: true
  validates :outround, inclusion: { in: [true, false] }

  has_many :pairings
  belongs_to :tournament, counter_cache: true

  def outround?
    @outround
  end
end
