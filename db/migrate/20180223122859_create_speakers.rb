class CreateSpeakers < ActiveRecord::Migration[5.1]
  def change
    create_table :speakers do |t|
      t.belongs_to :user
      t.belongs_to :language
      t.timestamps
    end
  end
end
