class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
  end


  #def create
  #  @user = User.create(user_params)
  #  #render plain: @user.inspect
  #  if @user.save
  #    flash[:success] = "Willkommen bei Memo!"
  #    redirect_to @user
  #  else
  #    render 'new'
  #  end
  #end


  def show
    @user= User.find(params[:id])
  end

  def locale
    @user= User.find(params[:id])
    @user.locale = params[:locale]
    if @user.save
      redirect_back(fallback_location: root_path)
    else
      flash[:error] = t('notifications.general.error')
      redirect_back(fallback_location: root_path)
    end
  end

  #def edit
  #  @user = User.find(params[:id])
  #end


  #def update
  #  @user = User.find(params[:id])
  #  if @user.update(user_params)
  #    flash[:success] = "Benutzerkonto wurde aktualisiert."
  #    redirect_to @user
  #  else
  #    render 'edit'
  #  end
  #end


  def destroy
    @user= User.find(params[:id])
    if @user.destroy
      flash[:success] = "Das Benutzerkonto wurde gelöscht."
      redirect_to users_url
    else
      flash[:error] = "Das Benutzerkonto konnte nicht gelöscht werden."
      render 'index'
    end
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :terms)
    end

end
