class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:edit, :update, :destroy]

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.resume = Resume.first # tu l’associes ici
    if @experience.save
      redirect_to resume_path(Resume.first), notice: "Expérience ajoutée ✅"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @experience.update(experience_params)
      redirect_to resume_path(@experience.resume), notice: "Expérience mise à jour ✅"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    resume = @experience.resume
    @experience.destroy
    redirect_to resume_path(resume), notice: "Expérience supprimée 🗑️"
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:title, :company, :start_date, :end_date, :description)
  end
end
