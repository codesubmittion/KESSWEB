class AddRubyLastnameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ruby_lastname, :string
  end
end
