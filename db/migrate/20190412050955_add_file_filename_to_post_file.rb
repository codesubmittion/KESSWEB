class AddFileFilenameToPostFile < ActiveRecord::Migration[5.2]
  def change
    add_column :post_files, :file_filename, :string
  end
end
