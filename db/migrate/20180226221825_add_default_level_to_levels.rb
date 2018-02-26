class AddDefaultLevelToLevels < ActiveRecord::Migration[5.1]
  def change
    change_column :levels, :level, :integer, default: 0
  end
end
