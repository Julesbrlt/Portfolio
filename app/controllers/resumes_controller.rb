class ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @resume.update(resume_params)
      redirect_to resume_path(@resume), notice: "Cv mis à jour ✅"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_resume
    @resume = Resume.first
  end

  def resume_params
    params.require(:resume).permit(:title, :summary, :pdf)
  end
end
