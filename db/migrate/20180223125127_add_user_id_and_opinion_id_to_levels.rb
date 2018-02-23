class AddUserIdAndOpinionIdToLevels < ActiveRecord::Migration[5.1]
  def change
    add_reference :levels, :user
    add_reference :levels, :technology
  end
end
