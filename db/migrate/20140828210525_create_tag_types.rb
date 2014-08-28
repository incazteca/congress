class CreateTagTypes < ActiveRecord::Migration
  def change
    create_lookup_table :tag_types
  end
end
