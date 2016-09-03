class User < ActiveRecord::Base
  has_many :shows
  validates :display_name, :presence => true
  validates :username, :presence => true
  validates :password, :presence => true
  validates_uniqueness_of :username

  has_secure_password

  def slug
    username.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    User.all.find{ |user| user.slug == slug}
  end

end
