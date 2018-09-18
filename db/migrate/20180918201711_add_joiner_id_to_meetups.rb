class AddJoinerIdToMeetups < ActiveRecord::Migration[5.2]
  def change
    add_column :meetups, :joiner_id, :integer
  end
end
