class SessionsController < ApplicationController
  include CurrentUserConcern

  # Create a session to log in a user
  def create
    user = User.find_by(email: user_params[:email])

    if user && user.authenticate(user_params[:password])  # Authenticate the user with the password
      session[:user_id] = user.id  # Store the user ID in the session
      render json: {
        status: "created",
        logged_in: true,
        user: user
      }
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  # Check if the user is logged in
  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: { logged_in: false, message: "User not logged in" }
    end
  end

  # Logout the user by clearing the session
  def logout
    reset_session
    render json: { status: 200, logged_out: true }
  end

  private

  # Strong parameters to permit only the necessary fields
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
