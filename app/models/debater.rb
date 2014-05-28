class Debater < ActiveRecord::Base

	attr_accessor :school

	belongs_to :team

	has_many :schools, through: :affiliations
	has_many :affiliations, as: :affiliatable, inverse_of: :affiliatable, dependent: :destroy
	has_many :rounds, through: :pairings
	has_many :pairings, through: :team
	has_many :speaker_points, dependent: :destroy
	has_many :ranks, dependent: :destroy
	has_one :seed, dependent: :destroy

	has_many :wins, through: :pairings
	# ruby operates by convention
	# but also doesn't like weird spelling rules...
	# I find this funny.
	has_many :losses, through: :pairings

	validates :team_id, :school, :name, presence: true
	before_validation :ensure_seed

	after_commit :set_affiliation

	def set_affiliation
		affiliation = self.affiliations.role(:debater)
		affiliation.school = self.school
	end

	def ensure_seed
		self.seed ||= self.seed.new(seed_type: 0)
	end

end
