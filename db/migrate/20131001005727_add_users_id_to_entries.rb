class AddUsersIdToEntries < ActiveRecord::Migration
  def up
    add_column :entries, :user_id, :integer
  end

  def down
    remove_column :entries, :user_id, :integer
  end
end
