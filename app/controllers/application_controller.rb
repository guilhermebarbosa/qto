class ApplicationController < ActionController::Base
  include Authentication
  helper :all
  protect_from_forgery
  before_filter { |c| Authorization.current_user = c.current_user }

  protected

  def permission_denied
    flash[:error] = "Desculpe, você não está autorizado a acessar essa página."
    if current_user
      redirect_to root_url
    else
      redirect_to new_user_session_url
    end
  end
end