class RemoveUnneededColumns < ActiveRecord::Migration
  def change
    remove_column :bills, :official_title, :text
    remove_column :bills, :popular_title, :string
    remove_column :bills, :short_title, :string
    remove_column :bills, :chamber, :string
    remove_column :bills, :bill_type, :string

    remove_column :legislators, :party, :string
    remove_column :legislators, :chamber, :string
  end
end
