class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :content
      t.text :image
      t.integer :user_id

      t.timestamps
    end
  end
end
