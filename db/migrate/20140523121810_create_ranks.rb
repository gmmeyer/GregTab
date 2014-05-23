class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
    	t.integer :pairing_id
    	t.integer :debater_id
    	t.integer :rank

      t.timestamps
    end
    add_index :ranks, [:pairing_id, :rank], unique: true
  end
end
