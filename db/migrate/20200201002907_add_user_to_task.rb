class AddUserToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :user, :reference
  end
end
