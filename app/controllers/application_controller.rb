class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pagy::Backend
  
  include Pundit
  before_action :set_global_action, if: :user_signed_in?

  def set_global_action
    @ransack_path = created_projects_path
    @ransack_projects = Project.where({user: current_user}).ransack(params[:projects_search], search_key: :projects_search)
    @pagy, @projects = pagy(@ransack_projects.result.includes(:user))
    # @ransack_projects = Project.ransack(params[:projects_search], search_key: :projects_search) #navbar search
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end
