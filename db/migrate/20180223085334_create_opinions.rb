class CreateOpinions < ActiveRecord::Migration[5.1]
  def change
    create_table :opinions do |t|
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
