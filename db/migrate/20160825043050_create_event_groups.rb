class CreateEventGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :event_groups do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :location, null: false
      t.string :status, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.datetime :deleted_at, index: true
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
