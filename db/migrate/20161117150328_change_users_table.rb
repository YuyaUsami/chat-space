class ChangeUsersTable < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :name , :false
    add_foreign_key :users, :groups
  end
end
