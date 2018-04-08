class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :content
      t.text :image
      t.integer :yoggies_id

      t.timestamps
    end
  end
end
