class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
    	t.integer :pairing_id
    	t.integer :type
    	t.integer :team_id

      t.timestamps
    end
  end
end
