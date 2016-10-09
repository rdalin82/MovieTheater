class CreateCreditcards < ActiveRecord::Migration
  def change
    create_table :creditcards do |t|
      t.string :number
      t.datetime :expiration_date
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :creditcards, :users
  end
end
