class CreateAuditoria < ActiveRecord::Migration
  def change
    create_table :auditoria do |t|
      t.text :name
      t.integer :capacity
      t.references :theater, index: true

      t.timestamps null: false
    end
    add_foreign_key :auditoria, :theaters
  end
end
