class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.belongs_to :bills

      t.string :bioguide_id
      t.string :title
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :name_suffix
      t.string :nickname
      t.boolean :in_office
      t.date :birthday
      t.date :term_end
      t.date :term_start
      t.string :chamber
      t.string :contact_form
      t.string :district
      t.string :gender
      t.string :leadership_role
      t.string :office
      t.string :party
      t.string :state
      t.string :state_name
      t.string :website

      add_index :bioguide_id
    end
  end
end
