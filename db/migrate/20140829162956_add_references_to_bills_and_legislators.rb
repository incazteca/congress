class AddReferencesToBillsAndLegislators < ActiveRecord::Migration
  def change
    change_table :bills do |t|
      t.belongs_to :congress_house
    end

    change_table :legislators do |t|
      t.belongs_to :congress_house
      t.belongs_to :party
    end
  end
end
