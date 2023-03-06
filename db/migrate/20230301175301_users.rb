class Users < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :Fullname
      t.string :image_url
      t.string :email
      t.string :phone_number
      t.string :task
      t.string :description
      t.integer :star_rating
      t.string :comment
      t.string :feedback
      
      t.timestamps
    end
  end
end
