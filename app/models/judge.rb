class Judge < ActiveRecord::Base

  attr_accessor :school

  has_many :scratches
  has_many :rounds, through: :pairings
  has_many :pairings
  has_many :schools, through: :affiliations
  has_many :affiliations, as: :affiliatable, inverse_of: :affiliatable, dependent: :destroy
  has_many :registrations, as: :registerable, inverse_of: :registerable, dependent: :destroy
  has_many :tournaments, through: :registrations, source: :tournament

  validates :rank, :school, :name, presence: true
  validates :rank, inclusion: { in: (0..10) }

  after_commit :set_affiliation


  def set_affiliation
    affiliation = self.affiliations.role(:judge)
    affiliation.school = self.school
  end


end
