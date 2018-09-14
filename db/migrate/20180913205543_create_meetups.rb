class CreateMeetups < ActiveRecord::Migration[5.2]
  def change
    create_table :meetups do |t|
      t.string :user_one
      t.string :user_two
      t.datetime :meet_time
      t.string :location

      t.timestamps
    end
  end
end