class SetDefaultsInUsers < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, :default => ''
    change_column :users, :first_name, :string, :default => ''
    change_column :users, :last_name, :string, :default => ''
    change_column :users, :email, :string, :default => ''
  end
end
