module Api::V1
  class SessionsController < ApplicationController
    skip_before_action :authenticate

    # POST /sessions
    def create
      user = User.find_by(email: session_params[:email]).try(:authenticate, session_params[:password])

      if user.present?
        render json: user, status: :created
      else
        render json: {}, status: :unprocessable_entity
      end
    end

  private

    # Only allow a trusted parameter "white list" through.
    def session_params
      params.require(:user).permit(:email, :password)
    end
  end
end
