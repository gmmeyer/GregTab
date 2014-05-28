class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
    	t.integer :result_id
    	t.integer :debater_id
    	t.integer :judge_id
    	t.integer :pairing_id
    	t.integer :rank

      t.timestamps
    end
  end
end
