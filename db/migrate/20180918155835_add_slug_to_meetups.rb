class AddSlugToMeetups < ActiveRecord::Migration[5.2]
  def change
    add_column :meetups, :slug, :string
    add_index :meetups, :slug, unique: true
  end
end
