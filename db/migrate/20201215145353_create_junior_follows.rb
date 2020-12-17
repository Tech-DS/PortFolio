class CreateJuniorFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :junior_follows do |t|
      t.integer :senior_id
      t.integer :junior_id
      t.timestamps
    end
  end
end
