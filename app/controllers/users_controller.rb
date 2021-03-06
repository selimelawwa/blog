class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page], per_page:2)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id #sign in upon sign up
        flash[:success] = "Welcome to Selim's Blog, #{@user.username}"
        redirect_to user_path(@user)
    else 
        render 'new'
    end
    
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    #@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "#{@user.username}, your details have been succesfully edited!"
      redirect_to articles_path
    else
      render 'edit'
  end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    flash[:danger] = "User and related Articles have been  deleted"
    redirect_to users_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :encrypted_password)
    end
   def set_user
    @user = User.find(params[:id])
   end

  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = "You can only edit/delete your own profile"
      redirect_to root_path
    end
  end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only admin users can perform this action"
      redirect_to root_path
    end
  end


    
end
