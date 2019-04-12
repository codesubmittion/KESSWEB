class AddTargetSectionToPostFile < ActiveRecord::Migration[5.2]
  def change
    add_column :post_files, :target_section, :string
  end
end
