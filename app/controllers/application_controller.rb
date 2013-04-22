class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :set_active_menu

  def after_sign_in_path_for(resource)
    assessments_path
  end

  def set_active_menu
    @active_menu ||= 'assessments/index'
  end

  def set_active_menu_to_assessments_mine
    @active_menu = 'assessments/mine'
  end
end
