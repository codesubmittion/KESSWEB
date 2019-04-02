class AddRubyFamilynameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ruby_firstname, :string
  end
end
