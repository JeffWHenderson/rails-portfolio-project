class AddCommentsToUserGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :user_groups, :comment, :string
  end
end
