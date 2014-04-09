class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.string :address
      t.string :time
      t.integer :count_members
      t.integer :max_members
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
