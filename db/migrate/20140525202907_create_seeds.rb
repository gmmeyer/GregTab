class CreateSeeds < ActiveRecord::Migration
  def change
    create_table :seeds do |t|
    	t.integer :debater_id
    	t.integer :seed_type

      t.timestamps
    end
  end
end
