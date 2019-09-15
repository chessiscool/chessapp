class RemoveDetailsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user_name, :string
    remove_column :users, :user_id, :integer
  end
end
