class CreateEventGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :event_groups do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :location, null: false
      t.integer :status, null: false, default: 0
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
