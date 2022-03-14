class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.integer :end_user_id, null: false
      t.integer :genre_id, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.string :location, null: false

      t.timestamps
    end
  end
end
