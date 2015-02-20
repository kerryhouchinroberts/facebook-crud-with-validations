class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :status_message
      t.string :user
      t.integer :likes

      t.timestamps null: false
    end
  end
end
