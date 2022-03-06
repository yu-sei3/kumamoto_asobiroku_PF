class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :end_user_id, null: false
      t.integer :post_image_id, null: false

      t.timestamps
    end
  end
end
