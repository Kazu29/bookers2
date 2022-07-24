class RemoveUserIdFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :User_id, :intger
  end
end
