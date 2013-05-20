class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def twitter_connect
    request_token = twitter_client.request_token(:oauth_callback => auth_url)
    session[:request_token] = request_token.token
    session[:request_token_secret] = request_token.secret
    redirect_to request_token.authorize_url
  end
  
  def twitter_auth
   begin 
      @access_token = twitter_client.authorize(
        session[:request_token],
        session[:request_token_secret],
        :oauth_verifier => params[:oauth_verifier]
      )
    rescue OAuth::Unauthorized
      session[:request_token] = nil
      session[:request_token_secret] = nil
      redirect_to twitter_path
    end
    
    if twitter_client.authorized?
      current_user.token = @access_token.token
      current_user.secret = @access_token.secret
      current_user.save
      redirect_to root_url
    end
  end
  
  def twitter_disconnect
    session[:request_token] = nil
    session[:request_token_secret] = nil
    current_user.token = nil
    current_user.secret = nil
    current_user.save
    redirect_to root_url
  end
  
  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
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
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'Signed up!'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :token, :secret)
    end
end
