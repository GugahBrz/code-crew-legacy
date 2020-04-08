class BaseController < ApplicationController
  include Pundit
  protect_from_forgery

  after_action :verify_authorized, except: %i[index new create]
  after_action :verify_policy_scoped, only: :index

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
