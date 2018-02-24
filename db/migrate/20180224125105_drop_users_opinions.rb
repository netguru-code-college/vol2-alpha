class DropUsersOpinions < ActiveRecord::Migration[5.1]
  def change
    drop_table :users_opinions
  end
end
