class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :bill_id
      t.string :related_bill_ids
      t.string :bill_type
      t.string :number
      t.string :congress
      t.string :chamber
      t.string :official_title
      t.string :popular_title
      t.string :short_title
      t.string :enacted_as
      t.boolean :history_active
      t.boolean :history_awaiting_signature
      t.boolean :history_enacted
      t.boolean :history_vetoed
      t.datetime :introduced_on
      t.datetime :last_action_at
      t.datetime :last_version_on
      t.datetime :last_vote_at
      t.string :sponsor_id
      t.integer :cosponsors_count
      t.string :withdrawn_cosponsors_count

      add_index :bill_id
    end
  end
end
