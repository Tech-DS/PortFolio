class AddInfoToSeniors < ActiveRecord::Migration[5.2]
  def change
    add_column :seniors, :name_kana, :string
    add_column :seniors, :profile_image_id, :string
    add_column :seniors, :icon_image_id, :string
    add_column :seniors, :birth_date, :date
    add_column :seniors, :address, :string
    add_column :seniors, :phone_number, :string
  end
end
