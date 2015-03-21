class MainController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.create(subscriber_params)
    if @user.persisted?
      flash[:notice] = t(:subscribed)
      UserMailer.subscribed(@user).deliver_later
    else
      flash[:danger] = @user.errors.full_messages.join(", ").capitalize
    end
    redirect_to root_path
  end

  private

  def subscriber_params
    params.require(:user).permit(:email)
  end
end
