class ChangeReferenceForBillsOnTitles < ActiveRecord::Migration
  def change
    remove_column :titles, :bills_id, :integer

    change_table :titles do |t|
      t.belongs_to :bill
    end
  end
end
