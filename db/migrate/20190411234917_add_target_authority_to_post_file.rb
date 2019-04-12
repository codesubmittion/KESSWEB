class AddTargetAuthorityToPostFile < ActiveRecord::Migration[5.2]
  def change
    add_column :post_files, :target_authority, :string
  end
end
