class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.references :ticket, index: true

      t.timestamps null: false
    end
    add_foreign_key :users, :tickets
  end
end
