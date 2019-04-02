class AddCharFamilynameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :char_firstname, :string
  end
end
