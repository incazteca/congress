class ChangeReferenceForUsersOnTags < ActiveRecord::Migration
  def change
    remove_column :tags, :users_id, :integer

    change_table :tags do |t|
      t.belongs_to :user
    end
  end
end
