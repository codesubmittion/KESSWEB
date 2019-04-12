class AddTargetGradeToPostFile < ActiveRecord::Migration[5.2]
  def change
    add_column :post_files, :target_grade, :string
  end
end
