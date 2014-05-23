class SchoolAffiliations < ActiveRecord::Migration
  def change
  	create_table :school_affiliations do |t|

  		# This might be able to be polymorphic, not yet though.
  		# But, hybrids would be very easily supported through that.

  		t.integer :judge_id
  		t.integer :school_id

  	end
  end
end
