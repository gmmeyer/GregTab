class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.integer :round_id
      t.integer :pairing_rank
      
      t.timestamps
    end
  end
end
