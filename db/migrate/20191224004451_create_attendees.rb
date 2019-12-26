class CreateAttendees < ActiveRecord::Migration[6.0]
  def change
    create_table :attendees do |t|
      t.integer :event_id
      t.integer :attendee_id

      t.timestamps
    end
  end
end
