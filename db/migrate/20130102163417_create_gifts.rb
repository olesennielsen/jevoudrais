class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name
      t.references :receiver
      t.integer :giver_id

      t.timestamps
    end
    add_index :gifts, :receiver_id
  end
end
