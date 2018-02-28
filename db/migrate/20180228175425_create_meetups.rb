class CreateMeetups < ActiveRecord::Migration[5.1]
  def change
    create_table :meetups do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :date
      t.references :technology, foreign_key: true
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
