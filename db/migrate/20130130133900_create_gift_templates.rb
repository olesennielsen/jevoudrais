class CreateGiftTemplates < ActiveRecord::Migration
  def change
    create_table :gift_templates do |t|
      t.string :name
      t.string :image_link
      t.string :product_link
      t.references :gift_creator

      t.timestamps
    end
    add_index :gift_templates, :gift_creator_id
  end
end
