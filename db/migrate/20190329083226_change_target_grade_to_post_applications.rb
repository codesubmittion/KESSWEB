class ChangeTargetGradeToPostApplications < ActiveRecord::Migration[5.2]
  def change
  	change_column :post_applications, :target_grade, :string
  end
end
