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

end
