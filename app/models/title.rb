class Title < ActiveRecord::Base
  belongs_to :bill
  belongs_to :title_type
end
