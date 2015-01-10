class AccessControl < ActiveRecord::Base
  belongs_to :group
  belongs_to :accessible, :polymorphic => true
  default_scope { order('position') }
end
