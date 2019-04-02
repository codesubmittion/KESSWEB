class CreatePostApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :post_applications do |t|
      t.text :title
      t.integer :user_id
      t.text :comment
      t.text :place
      t.datetime :date
      t.datetime :deadline

      t.timestamps
    end
  end
end
