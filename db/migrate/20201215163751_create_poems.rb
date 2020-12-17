class CreatePoems < ActiveRecord::Migration[5.2]
  def change
    create_table :poems do |t|
      t.integer :senior_id
      t.string :top
      t.string :mid
      t.string :bottom
      t.timestamps
    end
  end
end
