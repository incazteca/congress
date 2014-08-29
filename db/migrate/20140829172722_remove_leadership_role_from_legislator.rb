class RemoveLeadershipRoleFromLegislator < ActiveRecord::Migration
  def change
    remove_column :legislators, :leadership_role, :string

    change_table :legislators do |t|
      t.belongs_to :leadership_role
    end
  end
end
