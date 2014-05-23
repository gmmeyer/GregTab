class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.integer :round_id
      t.integer :team_1_id
      t.integer :team_2_id
      
      t.timestamps
    end
  end
end
