class CreateMeetupTags < ActiveRecord::Migration[5.1]
  def change
    create_table :meetup_tags do |t|
      t.integer :tag_id
      t.integer :meetup_id

      t.timestamps
    end
  end
end
