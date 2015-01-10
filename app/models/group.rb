class Group < AbstractPage
  has_many :memberships
  has_many :users, through: :memberships
  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
  # validates :users, :presence => true
  has_paper_trail
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
