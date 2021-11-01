class SiteController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    @projects_count = Project.all.count
  end
end
