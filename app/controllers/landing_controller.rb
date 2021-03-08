class LandingController < ApplicationController
  before_action :set_locale

  def index
      render :layout => true
  end

  private

  def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
      @locale = params[:locale]
  end
end