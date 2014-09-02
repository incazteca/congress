class Legislator < ActiveRecord::Base
  has_many :bill
  lookup_for :chamber
  lookup_for :leadership_role
  lookup_for :party
end
