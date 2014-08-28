class CreateTitleTypes < ActiveRecord::Migration
  def change
    create_lookup_table :title_types
  end
end
