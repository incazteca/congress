class ChangeReferenceForLegislatorsonBills < ActiveRecord::Migration
  def change
    remove_column :bills, :legislators_id, :integer

    change_table :bills do |t|
      t.belongs_to :legislator
    end
  end
end
