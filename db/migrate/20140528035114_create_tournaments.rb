class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
    	t.datetime :date
    	t.integer :user_id
    	t.integer :host_school_id

      t.timestamps
    end
  end
end
