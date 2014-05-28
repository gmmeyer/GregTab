class CreateSchoolAffiliations < ActiveRecord::Migration
  def change
  	create_table :school_affiliations do |t|

      t.integer :school_id
      t.integer :affiliatable_id
      t.string :affiliatable_type
      t.integer :role_id

      t.timestamps
  	end
  end
end
