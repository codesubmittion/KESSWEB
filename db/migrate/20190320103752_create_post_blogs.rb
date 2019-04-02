class CreatePostBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :post_blogs do |t|
      t.integer :user_id
      t.string :image_id
      t.text :title
      t.text :content
      t.text :category

      t.timestamps
    end
  end
end
