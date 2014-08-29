class Tag < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag_type
end
