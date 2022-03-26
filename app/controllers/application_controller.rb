class ApplicationController < ActionController::Base
  before_action :set_locale
  around_action :switch_locale
  helper_method :user_signed_in?, :current_user

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options(options = {})
    { :locale => I18n.locale }.merge options
  end

  private
    def user_signed_in?
      session[:random2022] != nil
    end

    def current_user
      if user_signed_in?
        User.find(session[:random2022])
      else
        nil
      end
    end

    def check_login!
      if not user_signed_in?
        redirect_to "/users/sign_in"
      end
    end

end
