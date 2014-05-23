class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
    	t.integer :round_number
    	t.boolean :outround

      t.timestamps
    end
  end
end
