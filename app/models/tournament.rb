class Tournament < ActiveRecord::Base
	validates :date, :host_school_id, :user_id, presence: true

	has_many :registrations, inverse_of: :tournament, dependent: :destroy
	has_many :teams, through: :registrations
	has_many :schools, through: :teams
	has_many :debaters, through: :teams

	belongs_to :creator, class_name: "User", foreign_key: :user_id
	belongs_to :host_school, class_name: "School", foreign_key: :host_school_id

end
