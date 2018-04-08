class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :image
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
