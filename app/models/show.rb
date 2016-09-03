class Show < ActiveRecord::Base
  belongs_to :user
  has_one :genre
  has_one :length

  def show_genre
    Genre.find(self.genre_id).name
  end

  def show_length
    Length.find(self.length_id).length_description
  end

  def slug
    title.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Show.all.find{ |show| show.slug == slug}
  end

end
