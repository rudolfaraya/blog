class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_categories

  protected

  def authenticate_editor!
    redirect_to root_path unless user_signed_in? && current_user.is_editor_user?
  end

  def authenticate_admin!
    redirect_to root_path unless user_signed_in? && current_user.is_admin_user?
  end

  private

  def set_categories
    @categories = Category.all
  end
end
