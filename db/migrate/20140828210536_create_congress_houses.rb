class CreateCongressHouses < ActiveRecord::Migration
  def change
    create_lookup_table :congress_houses
  end
end
