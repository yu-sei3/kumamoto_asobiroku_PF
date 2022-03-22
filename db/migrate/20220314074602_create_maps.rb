class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps do |t|
      t.string :address
      t.float :latitube
      t.float :longitube
      t.integer :post_image_id

      t.timestamps
    end
  end
end
