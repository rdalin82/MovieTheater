class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :movie, index: true

      t.timestamps null: false
    end
    add_foreign_key :tickets, :movies
  end
end
