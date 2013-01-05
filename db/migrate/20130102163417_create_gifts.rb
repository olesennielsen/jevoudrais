class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name
      t.references :user
      t.integer :giver_id

      t.timestamps
    end
    add_index :gifts, :user_id
  end
end
