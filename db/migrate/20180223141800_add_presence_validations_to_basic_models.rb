class AddPresenceValidationsToBasicModels < ActiveRecord::Migration[5.1]
  def change
    change_column_null :levels, :level, false
    change_column_null :languages, :name, false
    change_column_null :opinions, :content, false
    change_column_null :opinions, :rating, false
    change_column_null :technologies, :name, false
    change_column_null :technologies, :category, false
    change_column_null :users, :first_name, false
    change_column_null :users, :last_name, false
  end
end
