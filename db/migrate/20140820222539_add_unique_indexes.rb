class AddUniqueIndexes < ActiveRecord::Migration
  def change
    remove_index :legislators, :bioguide_id
    remove_index :bills, :bill_id

    add_index :legislators, :bioguide_id, unique: true
    add_index :bills, :bill_id , unique: true
  end
end
