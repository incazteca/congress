class CreateParties < ActiveRecord::Migration
  def change
    create_lookup_table :parties
  end
end
