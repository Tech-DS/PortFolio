class AddSeniorsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :senior_id, :integer
  end
end
