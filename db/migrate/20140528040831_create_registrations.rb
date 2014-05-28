class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :tournament_id
      t.integer :registerable_id
      t.string :registerable_type
      t.integer :role_id

      t.timestamps
    end
  end
end
