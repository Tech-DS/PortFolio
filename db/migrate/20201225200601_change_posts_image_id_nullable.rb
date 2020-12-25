class ChangePostsImageIdNullable < ActiveRecord::Migration[5.2]
  def change
     change_column_null :posts, :image_id, true
  end
end
