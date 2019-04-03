class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.string :main_image_id
      t.string :sub_image_id

      t.timestamps
    end
  end
end
