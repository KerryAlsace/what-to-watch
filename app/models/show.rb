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

  def edit_show(params)
    genre_id = (params["show_genre"].to_i)
    length_id = (params["show_length"].to_i)
    self.update(title: params["title"])
    if !(self.genre_id == genre_id)
      set_show_genre(params)
    end
    if !(self.length_id == length_id)
      set_show_length(params)
    end
    self.save
  end

  def set_show_genre(params)
    if genre_dropdown_blank?(params)
      self.genre_id = Genre.create(name: params["new_genre"]).id
    else
      self.genre_id = params["show_genre"].to_i
    end
  end

  def set_show_length(params)
    if length_dropdown_blank?(params)
      self.length_id = Length.create(length_description: params["new_length"]).id
    else
      self.length_id = params["show_length"].to_i
    end
  end

  def title_field_blank?(params)
    params["title"] == ""
  end

  def genre_dropdown_blank?(params)
    params["show_genre"] == ""
  end

  def new_genre_field_blank?(params)
    params["new_genre"] == ""
  end

  def length_dropdown_blank?(params)
    params["show_length"] == ""
  end

  def new_length_field_blank?(params)
    params["new_length"] == ""
  end

end
