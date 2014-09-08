class Legislator < ActiveRecord::Base
  has_many :bills
  lookup_for :chamber
  lookup_for :leadership_role
  lookup_for :party

  def name
    "#{first_name} #{middle_name} #{last_name}"
  end

end
