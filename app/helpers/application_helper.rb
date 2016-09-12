module ApplicationHelpers

  def login(username, password)
    @user = User.find_by(username: username)
    if @user && @user.authenticate(password)
      session["username"] = @user.username
      session["display_name"] = @user.display_name
    else
      flash[:message] = "We don't recognize that username and password combo, try again."
      redirect to '/login'
    end
  end

  def current_user
    @current_user ||= User.find_by(username: session["username"]) if session["username"]
  end

  def logged_in?
    !!current_user
  end

  def logout!
    session.clear
  end

  def random_show
    if current_user.shows
      @random_show = (current_user.shows.sample).id
    end
  end

end
