class AddCharLastnameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :char_lastname, :string
  end
end
