module Api::V1
  class UsersController < ApiController
    # POST /users
    def create
      user = User.new(user_params)

      if user.save
        render json: user, status: :created, location: user
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @current_user.update(user_params)
        render json: @current_user
      else
        render json: @current_user.errors, status: :unprocessable_entity
      end
    end

  private

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

  end
end
