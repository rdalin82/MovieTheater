class CreateTheaters < ActiveRecord::Migration
   def change
     create_table :theaters do |t|
       t.text :name
 
        t.timestamps null: false
    end
   end
 end