class AddGiftTemplateToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :gift_template_id, :integer
  end
end
