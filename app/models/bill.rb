class Bill < ActiveRecord::Base
  has_on :legislator
end
