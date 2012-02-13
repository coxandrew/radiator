class CreateCalendarEvents < ActiveRecord::Migration
  def change
    create_table :calendar_events do |t|
      t.datetime :date
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
