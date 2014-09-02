class Bill < ActiveRecord::Base
  belongs_to :legislator
  lookup_for :chamber
end
