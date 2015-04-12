class CreatePigeons < ActiveRecord::Migration
  def change
    create_table :pigeon do |t|
      t.string :name
      t.string :color
      t.string :gender
      t.string :lives
    end
  end
end