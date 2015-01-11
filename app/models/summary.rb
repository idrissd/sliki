class Summary < ActiveRecord::Base
  belongs_to :thing
  store :view, accessors: [:title, :properties, :expression, :expression_format, :categories, :series, :y_axis_title]
  # default_scope { order(position: :asc) }
  validates :name, :presence => true, :uniqueness => {:scope => :thing_id, :case_sensitive => false}
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
