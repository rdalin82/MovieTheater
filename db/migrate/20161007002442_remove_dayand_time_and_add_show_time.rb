class RemoveDayandTimeAndAddShowTime < ActiveRecord::Migration
  def change
    change_table :movies do |t|
      t.remove :day, :time 
      t.datetime :showtime
    end
  end
end
