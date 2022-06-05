module ApplicationHelper

  def gravatar_for(user, options = { size: 80 })
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = image_src = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
  end

  def current_user
    # if session[:user_id] 
      # User.find(session[:user_id])
    # same
    # User.find(session[:user_id]) if session[:user_id] 
    
    #todo156 opimization using memoization 
    # every time refrence current_user method, this method will query 
    # User.find(session[:user_id]) to DB to get user 
    # and this is not very efficient
    # every click on user goes to DB
    # if we have already reference current_user object abailable
    # we can simply return that instead quering DB
    # we return current_user, if not then we do query User.find(session[:user_id])
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
    
  end

  def logged_in?
    # turninig current_user into boolean: 
    #it will returns true or false

    !!current_user 
    
  end
end
