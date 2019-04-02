class AddTargetGradeToPostApplication < ActiveRecord::Migration[5.2]
  def change
    add_column :post_applications, :target_grade, :integer
  end
end
