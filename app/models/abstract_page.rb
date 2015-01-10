class AbstractPage < ActiveRecord::Base
  belongs_to :author
  belongs_to :parent_control
end
