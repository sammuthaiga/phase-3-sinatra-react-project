class Plumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :plumbers do |t|
      t.string :name
      t.string :image_url 
      t.string :task
      t.string :description
      t.string :phone_number
      t.string :location
      t.integer :star_rating
      t.string :comment
      t.string :datetime

      t.timestamps
    end
  end
end
