class Bill < ActiveRecord::Base
  has_one :legislator
end
