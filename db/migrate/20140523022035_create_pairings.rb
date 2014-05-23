class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.integer :round_id
      t.integer :team_1_id
      t.integer :team_2_id
      t.integer :winner_id
      t.integer :speaker_1_points
      t.integer :speaker_2_points
      t.integer :speaker_3_points
      t.integer :speaker_4_points
      t.integer :speaker_1_rank
      t.integer :speaker_2_rank
      t.integer :speaker_3_rank
      t.integer :speaker_4_rank

      t.timestamps
    end
  end
end
