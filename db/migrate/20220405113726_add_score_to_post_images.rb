class AddScoreToPostImages < ActiveRecord::Migration[6.1]
  def change
    add_column :post_images, :score, :decimal, precision: 5, scale: 3
  end
end
