class AddImageToEntries < ActiveRecord::Migration
  def up
    add_column :entries, :entry_image_uid, :string
    add_column :entries, :entry_image_name, :string
  end

  def down
    remove_column :entries, :entry_image_uid, :string
    remove_column :entries, :entry_image_name, :string
  end
end
