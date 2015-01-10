class User < ActiveRecord::Base
  enum role: [:user, :developer, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
 before_save :ensure_authentication_token
 has_many :topics
 has_many :things
 has_many :kinds
 has_many :pages
 has_many :memberships
 has_many :groups, through: :memberships
 has_many :subscriptions
 has_many :topics, through: :subscriptions
 validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
 validates :email, :presence => true, :uniqueness => {:case_sensitive => false}

 extend FriendlyId
 friendly_id :name, use: [:slugged, :finders]

end
