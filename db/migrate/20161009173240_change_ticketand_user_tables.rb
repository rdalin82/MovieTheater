class ChangeTicketandUserTables < ActiveRecord::Migration
  def change
    add_column :tickets, :user_id, :integer
    remove_column :users, :ticket_id
  end
end
