class SkillsController < ApplicationController
  before_action :authenticate_user!, except: []
  before_action :check_admin
  before_action :set_skill, only: [:destroy]

  def new
    @skill = Skill.new
  end

  def create
    @education = Skill.new(skill_params)
    @skill.resume = Resume.first
    if @skill.save
      redirect_to resume_path, notice: "Compétence ajoutée ✅"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @skill.destroy
    redirect_to resume_path, notice: "Compétence supprimée 🗑️"
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name, :category, :level)
  end

  def check_admin
    redirect_to root_path, alert: "Accès interdit 🚫" unless current_user&.admin?
  end
end
