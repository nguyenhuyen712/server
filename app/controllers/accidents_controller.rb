class AccidentsController < ApplicationController
  before_action :find_user

  def new
    @accident = Accident.new
  end

  def create
    @accident = Accident.new accidents_params
    if @accident.save
  end

  private
  def accidents_params
    params.require(:accident).permit(:latitude, :longitude).merge user_id:
      user.id
  end

  def find_user
    @user = User.find_by phone: params[:phone]
    if @user.nil?
      flash[:danger] = t "flash.user_not_found"
      redirect_to root_path
    end
  end
end
