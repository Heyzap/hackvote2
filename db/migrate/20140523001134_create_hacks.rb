class CreateHacks < ActiveRecord::Migration
  def change
    create_table :hacks do |t|
      t.string :creator
      t.string :title
      t.integer :day_id
      t.integer :votes, :default => 0, :null => false

      t.timestamps
    end
  end
end
