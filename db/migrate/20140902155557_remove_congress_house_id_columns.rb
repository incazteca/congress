class RemoveCongressHouseIdColumns < ActiveRecord::Migration
  def change
    remove_column :bills, :congress_house_id, :integer
    remove_column :legislators, :congress_house_id, :integer

    change_table :bills do |t|
      t.belongs_to :chamber
    end

    change_table :legislators do |t|
      t.belongs_to :chamber
    end
  end
end
