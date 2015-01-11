class Topic < AbstractPage
  # has_many :things, :dependent => :destroy
  # has_many :pages, :dependent => :destroy
  # has_many :subscriptions
  # has_many :users, through: :subscriptions
  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]
  has_paper_trail

  def should_generate_new_friendly_id?
    name_changed?
  end

end
