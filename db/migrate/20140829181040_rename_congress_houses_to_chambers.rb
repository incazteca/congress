class RenameCongressHousesToChambers < ActiveRecord::Migration
  def change
    drop_table :congress_houses
    create_lookup_table :chambers
  end
end
