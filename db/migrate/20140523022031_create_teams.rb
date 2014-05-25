class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
    	t.string :name
    	t.integer :school_id
    	t.integer :wins
    	t.integer :losses

      t.timestamps
    end
    
  end
end
