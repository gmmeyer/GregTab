class CreatePairingMembers < ActiveRecord::Migration
  def change
    create_table :pairing_members do |t|
    	t.integer :pairing_id
    	t.integer :team_id
    	t.integer :side

      t.timestamps
    end
  end
end
