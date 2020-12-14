class CreateTimelines < ActiveRecord::Migration[5.2]
  def change
    create_table :timelines do |t|
      t.integer "senior_id"
      t.string "year"
      t.string "age"
      t.string "event"
      t.text "detail"
      t.text "feel"
      t.string "image_id"
      t.timestamps
    end
  end
end
