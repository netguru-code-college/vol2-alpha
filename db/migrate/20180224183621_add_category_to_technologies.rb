class AddCategoryToTechnologies < ActiveRecord::Migration[5.1]
  def change
    remove_column :technologies, :category
    add_reference :technologies, :category, foreign_key: true
  end
end
