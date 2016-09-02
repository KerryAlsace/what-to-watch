class Show < ActiveRecord::Base
  belongs_to :user

  def slug
    title.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Show.all.find{ |show| show.slug == slug}
  end

end
