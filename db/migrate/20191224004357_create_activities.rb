class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :photo
      t.string :location
      t.string :type
      t.string :icon
      t.integer :event_id

      t.timestamps
    end
  end
end
