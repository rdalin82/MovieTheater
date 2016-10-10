class Removetheater < ActiveRecord::Migration
  def change
    remove_column :auditoria, :theater_id
    drop_table :theaters 
    drop_table :auditoriums_in_theater
  end
end
