class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :title

      t.timestamps
    end

    add_index :days, :title, unique: true 
  end
end
