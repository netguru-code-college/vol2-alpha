class AddLatAndLngToMeetups < ActiveRecord::Migration[5.1]
  def change
    add_column :meetups, :lat, :string
    add_column :meetups, :lng, :string
  end
end
