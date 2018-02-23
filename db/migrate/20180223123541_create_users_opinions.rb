class CreateUsersOpinions < ActiveRecord::Migration[5.1]
  def change
    create_table :users_opinions do |t|
      t.integer :user_id
      t.integer :owner_id
      t.integer :opinion_id

      t.timestamps
    end
  end
end
