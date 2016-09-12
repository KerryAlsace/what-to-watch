module ShowHelpers

  def valid_submission?
    !title_field_blank? && (!genre_dropdown_blank? || !new_genre_field_blank?) && (!length_dropdown_blank? || !new_length_field_blank?)
  end

  def login_warning_message
    flash[:message] = "Gotta log in before you can do that."
  end

  def owner_warning_message
    flash[:message] = "That's not your show to do that to!"
  end

  def complete_form_warning_message
    flash[:message] = "Every field needs to be filled out, make sure your show has a Title, a Genre, and a Length."
  end

  def show_deleted_message
    flash[:message] = "Show has been deleted!"
  end

  def title_field_blank?
    params["title"] == ""
  end

  def genre_dropdown_blank?
    params["show_genre"] == ""
  end

  def new_genre_field_blank?
    params["new_genre"] == ""
  end

  def length_dropdown_blank?
    params["show_length"] == ""
  end

  def new_length_field_blank?
    params["new_length"] == ""
  end

end
