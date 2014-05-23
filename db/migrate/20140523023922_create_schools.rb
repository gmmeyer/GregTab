class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
    	t.integer :name

      t.timestamps
    end
  end
end
