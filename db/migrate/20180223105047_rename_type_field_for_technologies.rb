class RenameTypeFieldForTechnologies < ActiveRecord::Migration[5.1]
  def change
    rename_column :technologies, :type, :category
  end
end
