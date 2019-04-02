class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.string :main_image_id, default: "main_image_default.jpg"
      t.string :sub_image_id ,default: "sub_image_default.jpg"

      t.timestamps
    end
  end
end
