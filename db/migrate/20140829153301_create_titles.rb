class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.belongs_to :bills
      t.text :title
      t.belongs_to :title_type
    end
  end
end
