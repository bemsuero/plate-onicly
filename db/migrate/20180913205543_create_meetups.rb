class CreateMeetups < ActiveRecord::Migration[5.2]
  def change
    create_table :meetups do |t|
      t.string :location_name
      t.string :user_one
      t.string :user_two
      t.date :meet_date
      t.time :meet_time
      t.string :location

      t.timestamps
    end
  end
end
