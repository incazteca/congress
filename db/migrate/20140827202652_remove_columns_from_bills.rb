class RemoveColumnsFromBills < ActiveRecord::Migration
  def change
    remove_column :bills, :related_bill_ids, :string
    remove_column :bills, :enacted_as, :string
  end
end
