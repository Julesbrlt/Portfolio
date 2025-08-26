class LanguagesController < ApplicationController
  before_action :authenticate_user!, except: []
  before_action :check_admin
  before_action :set_language, only: [:edit, :update]

  def edit
  end

  def update
    if @language.update(language_params)
      redirect_to resume_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_language
    @language = Language.find(params[:id])
  end

  def language_params
    params.require(:language).permit(:name, :level)
  end
end

def check_admin
    redirect_to root_path, alert: "Accès interdit 🚫" unless current_user&.admin?
  end

end
