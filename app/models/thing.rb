class Thing < AbstractPage
  belongs_to :topic
  # has_many :kinds, :order => :name, :dependent => :destroy
  # has_many :properties, :order => :position, :dependent => :destroy
  # has_many :summaries, :order => :position, :dependent => :destroy
  has_many :kinds, :dependent => :destroy
  has_many :properties, :dependent => :destroy
  has_many :summaries, :dependent => :destroy
  accepts_nested_attributes_for :properties, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :summaries, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  has_many :transitions, :dependent => :destroy
  accepts_nested_attributes_for :transitions, :reject_if => lambda { |a| a[:from_state].blank? || a[:to_state].blank? || a[:on_event].blank? }, :allow_destroy => true
  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]
  has_paper_trail

  def should_generate_new_friendly_id?
    name_changed?
  end

end
