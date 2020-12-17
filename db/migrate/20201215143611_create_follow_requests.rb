class CreateFollowRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :follow_requests do |t|
      t.integer :senior_id
      t.integer :junior_id
      t.timestamps
    end
  end
end
