class CreateSpeakerPoints < ActiveRecord::Migration
  def change
    create_table :speaker_points do |t|
    	t.integer :pairing_id
    	t.integer :debater_id
    	t.integer :speaker_points

      t.timestamps
    end
  end
end
