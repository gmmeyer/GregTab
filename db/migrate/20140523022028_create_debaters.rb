class CreateDebaters < ActiveRecord::Migration
  def change
    create_table :debaters do |t|
    	t.string :name
    	t.integer :school_id
    	t.integer :team_id

      t.timestamps
    end
  end
end
