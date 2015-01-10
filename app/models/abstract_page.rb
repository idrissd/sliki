class AbstractPage < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  default_scope { order('name') }
  belongs_to :parent_control, :class_name => 'AbstractPage'
  has_many :access_controls, as: :accessible
  accepts_nested_attributes_for :access_controls, :allow_destroy => true
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def inherited_access_controls
    i = self
    access_controls = []
    while (!i.parent_control.nil?)
      access_controls.push(i.parent_control.access_controls)
      i = i.parent_control
    end
    access_controls.reverse.flatten
  end
end
