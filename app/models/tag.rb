class Tag < ActiveRecord::Base
  belongs_to :user
  lookup_for :tag_type
end
