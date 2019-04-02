class CreatePostInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :post_informations do |t|
      t.text :title
      t.integer :user_id
      t.text :comment
      t.text :place
      t.datetime :date
      t.string :image_id

      t.timestamps
    end
  end
end
