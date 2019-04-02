class AddTargetSectionToPostApplication < ActiveRecord::Migration[5.2]
  def change
    add_column :post_applications, :target_section, :string
  end
end
