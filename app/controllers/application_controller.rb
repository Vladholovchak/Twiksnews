# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
   after_action :verify_authorized
   before_action :authenticate_user!
   before_action :configure_permitted_parameters, if: :devise_controller?
   rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  protected

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    redirect_to(root_path)
  end
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, source_ids:[])}
    end
end