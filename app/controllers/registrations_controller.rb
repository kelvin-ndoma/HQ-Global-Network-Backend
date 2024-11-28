class RegistrationsController < ApplicationController

  def create
    # Try to create the user. If any validation fails, an exception will be raised.
    user = User.create!(user_params)

    # Log the user in after successful registration
    session[:user_id] = user.id

    # Respond with success
    render json: {
      status: :created,
      user: user
    }
  rescue ActiveRecord::RecordInvalid => e
    # If there's an error (validation failure), respond with error messages
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  private

  # Strong parameters to whitelist attributes
  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :password, :password_confirmation, 
      :bio, :status, :role, :city, :country, :skills, :user_attributes, 
      :interests, :languages, :website, :social_links, :company, :job_title
    )
  end
end
