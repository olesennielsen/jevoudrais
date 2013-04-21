class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.references :gift_template

      t.timestamps
    end
    add_index :clicks, :gift_template_id
  end
end
