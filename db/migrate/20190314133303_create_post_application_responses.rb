class CreatePostApplicationResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :post_application_responses do |t|
      t.integer :user_id
      t.integer :post_application_id
      t.text :participation
      t.text :reason
      t.text :caption

      t.timestamps
    end
  end
end
