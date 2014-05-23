class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
    	t.integer :round_number
    	t.boolean :outround
    	t.integer :winner_id

      t.timestamps
    end
  end
end
