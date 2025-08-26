class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_admin, except: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project), notice: "Projet mis à jour ✅"
    else
      render :edit, status: unprocessable_entity
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :github_url, :demo_url, :image_url)
  end

  def check_admin
    redirect_to root_path, alert: "Accès interdit 🚫" unless current_user&.admin?
  end
end
