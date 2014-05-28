class CreateSchoolAffiliations < ActiveRecord::Migration
  def change
  	create_table :school_affiliations do |t|

  		# This might be able to be polymorphic, not yet though.
  		# But, hybrids would be very easily supported through that.

      t.integer :school_id
      t.integer :affiliatable_id
      t.string :affiliatable_type
      t.integer :role_id

      t.timestamps
  	end
  end
end
