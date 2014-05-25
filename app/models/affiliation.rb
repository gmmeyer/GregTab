class Affiliation < ActiveRecord::Base

	belongs_to :school, inverse_of: :affiliations, counter_cache: true 
	belongs_to :affiliatable, inverse_of: :affiliations, polymorphic: true, counter_cache: true
	


end