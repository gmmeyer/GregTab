class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      # do I want to move this all to registration?
      # or do I wanna just zero it out for each tourn
      # and then make another section for aggregate counts?
      t.integer :wins_count
      t.integer :losses_count
      t.integer :govs_count
      t.integer :opps_count
      t.boolean :recieved_bye

      t.timestamps
    end

  end
end
