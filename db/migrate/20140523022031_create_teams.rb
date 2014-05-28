class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
    	t.string :name
    	t.integer :wins_count
    	t.integer :losses_count
    	t.integer :govs_count
    	t.integer :opps_count

      t.timestamps
    end
    
  end
end
