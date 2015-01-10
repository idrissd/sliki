class Property < ActiveRecord::Base
  belongs_to :thing
  belongs_to :parent_control
  store :form, accessors: [:input, :label, :hint, :placeholder, :tooltip, :default, :expression, :file_types, :relationship, :string_input, :number_input, :date_time_input]
  store :view, accessors: [:hyperlink, :units, :precision, :boolean_format, :date_time_format, :expression_format, :css_class]
  belongs_to :thing
  default_scope { order('position') }
  validates :name, :presence => true, :uniqueness => {:scope => :thing_id, :case_sensitive => false}
  belongs_to :parent_control, :class_name => 'AbstractPage'
  has_many :access_controls, as: :accessible
  accepts_nested_attributes_for :access_controls, :allow_destroy => true
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
