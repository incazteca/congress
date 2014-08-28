class CreateLeadershipRoles < ActiveRecord::Migration
  def change
    create_lookup_table :leadership_roles
  end
end
