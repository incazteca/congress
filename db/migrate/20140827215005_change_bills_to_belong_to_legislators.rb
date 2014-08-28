class ChangeBillsToBelongToLegislators < ActiveRecord::Migration
  def change
    # Remove bills_id reference from legislators
    remove_column :legislators, :bills_id, :integer

    change_table :bills do |t|
      t.belongs_to :legislators
    end

  end
end
