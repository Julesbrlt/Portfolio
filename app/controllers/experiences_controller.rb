class ExperiencesController < ApplicationController
  before_action :set_resume
  before_action :set_experience, only: [:edit, :update, :destroy]

  def new
    @experience = @resume.experiences.new
  end

  def create
    @experience = @resume.experiences.new(experience_params)
    if @experience.save
      redirect_to resume_path(@resume), notice: "Expérience ajoutée ✅"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @experience.update(experience_params)
      redirect_to resume_path(@resume), notice: "Expérience mise à jour ✅"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @experience.destroy
    redirect_to resume_path(@resume), notice: "Expérience supprimée 🗑️"
  end

  private

  def set_resume
    @resume = Resume.first
  end

  def set_experience
    @experience = @resume.experiences.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:title, :company, :start_date, :end_date, :description)
  end
end
