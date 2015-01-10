class Page < AbstractPage
  belongs_to :topic
  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
