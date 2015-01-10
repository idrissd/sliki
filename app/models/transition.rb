class Transition < ActiveRecord::Base
  belongs_to :thing
  validates :thing, :from_state, :to_state, :on_event, :presence => true
end
