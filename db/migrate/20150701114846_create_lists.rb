class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.date :due_day
      t.boolean :finished

      t.timestamps null: false
    end
  end
end
