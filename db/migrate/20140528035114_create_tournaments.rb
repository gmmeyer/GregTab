class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
    	t.datetime :date

      t.timestamps
    end
  end
end
