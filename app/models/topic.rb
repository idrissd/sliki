class Topic < AbstractPage
  # has_many :things, :dependent => :destroy
  # has_many :pages, :dependent => :destroy
  # has_many :subscriptions
  # has_many :users, through: :subscriptions
  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  has_paper_trail
end
