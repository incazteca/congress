class AddItemIdToTags < ActiveRecord::Migration
  def change
    add_column :tags, :tagged_item_id, :integer
  end
end
