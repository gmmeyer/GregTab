class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
    	t.integer :name
    	t.integer :affiliations_count

      t.timestamps
    end
  end
end
