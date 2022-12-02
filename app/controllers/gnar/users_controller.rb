module Gnar
  class UsersController < AuthenticatedController
    before_action :set_users, only: [:index, :create]

    def index

    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.turbo_stream

          format.html { redirect_to gnar_user_path(@user), notice: "Gnarnian created!" }
        else
          format.turbo_stream do
            render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@user)}_form",
              partial: "new_form",
              locals: { user: @user })
          end

          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    private

    def user_params
      params.permit(:first_name, :last_name, :email)
    end

    def set_users
      @users = User.all.order(:first_name)
    end
  end
end
