class CreatePostFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :post_files do |t|
      t.string :title
      t.text :caption
      t.integer :user_id
      t.string :file_id

      t.timestamps
    end
  end
end
