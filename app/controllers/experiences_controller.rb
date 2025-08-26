class ExperiencesController < ApplicationController
  before_action :authenticate_user!, except: []
  before_action :check_admin
  before_action :set_experience, only: [:edit, :update, :destroy]

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.resume = Resume.first # tu l’associes ici
    if @experience.save
      redirect_to resume_path, notice: "Expérience ajoutée ✅"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @experience.update(experience_params)
      redirect_to resume_path, notice: "Expérience mise à jour ✅"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @experience.destroy
    redirect_to resume_path, notice: "Expérience supprimée 🗑️"
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:title, :company, :start_date, :end_date, :description)
  end

  def check_admin
    redirect_to root_path, alert: "Accès interdit 🚫" unless current_user&.admin?
  end
end
