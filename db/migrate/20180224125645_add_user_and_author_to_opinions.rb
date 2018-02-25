class AddUserAndAuthorToOpinions < ActiveRecord::Migration[5.1]
  def change
    add_reference :opinions, :user, foreign_key: true
    add_reference :opinions, :author, foreign_key: { to_table: :users }
  end
end
