module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Clean Blog"
    if page_title.empty?
      base_title
    else
      base_title + " - " + page_title
    end
  end

  def site_heading(page_title = '')
  	if page_title == 'Blog Post'
  		render 'layouts/post_head'
  	else
  		render 'layouts/site_head'
  	end
  end

  def logged_in?
    !session[:user_id].nil?
  end

  def is_admin?
    session[:is_admin]
  end

  def log_out
    @_request.reset_session
    #session.clear
  end
end
