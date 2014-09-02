class Title < ActiveRecord::Base
  belongs_to :bill
  lookup_for :title_type
end
