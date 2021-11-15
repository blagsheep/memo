class ApplicationController < ActionController::Base

  before_action :set_locale

  def default_url_options
    { locale: I18n.locale }
  end

private

  def set_locale
    if current_user
      I18n.locale = current_user.locale || I18n.default_locale
    else
      I18n.locale = extract_locale || I18n.default_locale
    end
  end


  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end



end
