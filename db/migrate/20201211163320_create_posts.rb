class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :senior_id
      t.text :body,       null: false
      t.string :image_id, null: false
      t.timestamps
    end
  end
end
