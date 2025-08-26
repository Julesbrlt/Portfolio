class EducationsController < ApplicationController
  before_action :authenticate_user!, except: []
  before_action :check_admin
  before_action :set_education, only: [:edit, :update, :destroy]

  def new
    @education = Education.new
  end

  def create
    @education = Education.new(education_params)
    @education.resume = Resume.first
    if @education.save
      redirect_to resume_path, notice: "Formation ajoutée ✅"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @education.update(education_params)
      redirect_to resume_path, notice: "Formation mise à jour ✅"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @education.destroy
    redirect_to resume_path, notice: "Formation supprimée 🗑️"
  end

  private

  def set_education
    @education = Education.find(params[:id])
  end

  def education_params
    params.require(:education).permit(:school, :degree, :start_date, :end_date, :description)
  end

  def check_admin
    redirect_to root_path, alert: "Accès interdit 🚫" unless current_user&.admin?
  end
end
