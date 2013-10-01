class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.text :post
      t.date :date_posted

      t.timestamps
    end
  end
end
