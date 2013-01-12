class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :event_date
      t.boolean :recurring

      t.timestamps
    end
  end
end
