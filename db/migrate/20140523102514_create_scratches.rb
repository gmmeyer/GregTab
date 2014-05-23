class CreateScratches < ActiveRecord::Migration
  def change
    create_table :scratches do |t|
    	t.integer :judge_id
    	t.integer :team_id
    	t.boolean :affiliation

      t.timestamps
    end
  end
end
