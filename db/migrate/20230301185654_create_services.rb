class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.integer :user_id
      t.integer :plumber_id

      t.timestamps 
    end
  end
end
