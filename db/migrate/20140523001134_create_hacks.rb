class CreateHacks < ActiveRecord::Migration
  def change
    create_table :hacks do |t|
      t.string :creator
      t.string :title
      t.integer :day_id
      t.integer :votes

      t.timestamps
    end
  end
end
