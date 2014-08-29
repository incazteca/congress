class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.belongs_to :users
      t.belongs_to :tag_type
    end
  end
end
