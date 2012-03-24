# This module is included in your application controller which makes
# several methods available to all controllers and views. Here's a
# common example you might add to your application layout file.
#
# <% if logged_in? %>
# Welcome <%=h current_user.username %>! Not you?
# <%= link_to "Log out", logout_path %>
# <% else %>
# <%= link_to "Sign up", signup_path %> or
# <%= link_to "log in", login_path %>.
# <% end %>
#
# You can also restrict unregistered users from accessing a controller using
# a before filter. For example.
#
# before_filter :login_required, :except => [:index, :show]
module Authentication
  def self.included(controller)
    controller.send :helper_method, :current_user
  end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  private
  
  def store_target_location
    session[:return_to] = request.fullpath
  end
end