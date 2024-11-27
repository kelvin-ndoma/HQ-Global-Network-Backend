# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
    include CurrentUserConcern
  
    # Create a session for a logged-in user
    def create
      user = User.find_by(email: params[:user][:email])
      if user&.authenticate(params[:user][:password])
        session[:user_id] = user.id
        render json: {
          status: :created,
          logged_in: true,
          user: user
        }
      else
        render json: { error: "Invalid email or password" }, status: :unauthorized
      end
    end

    def logged_in
        if @current_user
          response_data = { logged_in: true, user: @current_user.as_json(only: [:id, :first_name, :email, :role]) }
          if @current_user.admin?
            response_data[:users] = User.all.as_json(only: [:id, :first_name, :email, :role])
          end
          render json: response_data
        else
          render json: { logged_in: false }
        end
      end
    
      # Logout a user
      def logout
        reset_session
        render json: {
          status: 200,
          logged_out: true
        }
      end
    
      # Update user details
      def update
        if @current_user.update(user_params)
          render json: @current_user
        else
          render json: @current_user.errors, status: :unprocessable_entity
        end
      end
    
  
    
    private
  
    def user_params
      params.require(:user).permit(
        :first_name, :last_name, :email, :password, :password_confirmation, 
        :bio, :status, :role, :city, :country, :skills, :user_attributes, 
        :interests, :languages, :website, :social_links, :company, :job_title
      )
    end
  end
  