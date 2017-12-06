class CreateMeetups < ActiveRecord::Migration[5.1]
  def change
    create_table :meetups do |t|
      t.string :name
      t.string :location
      t.datetime :time
      t.integer :group_id
      
      t.timestamps
    end
  end
end
