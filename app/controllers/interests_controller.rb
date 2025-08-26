class InterestsController < ApplicationController
  before_action :authenticate_user!, except: []
  before_action :check_admin
  before_action :set_interest, only: [:destroy]

  def new
    @interest = Interest.new
  end

  def create
    @interest = Interest.new(interest_params)
    @interest.resume = Resume.first
    if @interest.save
      redirect_to resume_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @interest.destroy
    redirect_to resume_path
  end

  private

  def set_interest
    @interest = Interest.find(params[:id])
  end

  def interest_params
    params.require(:interest).permit(:name, :description)
    params.require(:interest).permit(:name, :description)
  end

  def check_admin
    redirect_to root_path, alert: "Accès interdit 🚫" unless current_user&.admin?
  end
end
