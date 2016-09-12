class Show < ActiveRecord::Base
  belongs_to :user
  has_one :genre
  has_one :length

  def show_genre
    Genre.find(self.genre_id).name
  end

  def show_length=(show_length)
    @show_length = show_length
  end

  def show_length
    Length.find(self.length_id).length_description
  end

  # def new_show_genre
  #   @show.genre = Genre.create(name: params["new_genre"])
  # end

  # if !(params["show_genre"] == "")
  #   @show.genre_id = params["show_genre"].to_i
  # else
  #   new_genre = Genre.create(name: params["new_genre"])
  #   @show.genre_id = new_genre.id
  # end
  # if !(params["show_length"] == "")
  #   @show.length_id = params["show_length"].to_i
  # else
  #   new_length = Length.create(name: params["new_length"])
  #   @show.length_id = new_length.id
  # end

end
