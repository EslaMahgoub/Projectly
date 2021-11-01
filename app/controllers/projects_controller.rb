class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  def index
    @ransack_path = projects_path
    @ransack_projects = Project.where({user: current_user}).ransack(params[:projects_search], search_key: :projects_search)
    
    @pagy, @projects = pagy(@ransack_projects.result.includes(:user)) # allow searching using tag through course_tags 
    authorize @projects
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def created 
    @ransack_path = created_projects_path
    @ransack_projects = Project.where({user: current_user}).ransack(params[:projects_search], search_key: :projects_search)
    @pagy, @projects = pagy(@ransack_projects.result.includes(:user))
    render 'index'
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "Project was successfully created." }
        ProjectMailer.new_project(@project).deliver_later
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
    
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "Project was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to created_projects_path, notice: "Project was successfully destroyed." }
    end
  end

  private
    def set_project
      @project = Project.friendly.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :start_date, :delivery_date, :company_id, :user_id, :source_language_id, :subject_area_id, :description, :instructions, :reference_file, :source_file, target_language_ids: [])
    end
end
