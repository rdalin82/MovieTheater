class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :movie_name
      t.date :day
      t.time :time
      t.integer :length
      t.references :auditorium, index: true

      t.timestamps null: false
    end
    add_foreign_key :movies, :auditoria
  end
end
