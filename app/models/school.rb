class School < ActiveRecord::Base
	has_many :debaters, through: :affiliations
	has_many :teams, through: :debaters, dependent: :destroy
	has_many :judges, through: :affiliations, dependent: :destroy
	has_many :affiliations, inverse_of: :school, dependent: :destroy

	has_many :tournaments, through: :teams, source: :tournaments

	has_many :hosted_tournaments, class_name: "Tournament", foreign_key: :host_school_id
end
