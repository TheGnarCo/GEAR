module Gnar
  class EmployeeAssetsController < AuthenticatedController
    before_action :set_assets

    def index
    end

    def new
      @asset = EmployeeAsset.new(user: @user)
    end

    def edit
      @asset = EmployeeAsset.find(params[:id])
    end

    def create
      @asset = EmployeeAsset.new(asset_params)

      respond_to do |format|
        if @asset.save
          format.turbo_stream

          format.html { redirect_to employee_asset_path(@asset), notice: "Asset created!" }
        else
          format.turbo_stream do
            render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@asset)}_form",
              partial: "form",
              locals: { asset: @asset })
          end

          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      @asset = EmployeeAsset.find(params[:id])

      respond_to do |format|
        if @asset.update(asset_params)
          format.turbo_stream

          format.html { redirect_to employee_asset_path(@asset), notice: "Asset created!" }
        else
          format.turbo_stream do
            render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@asset)}_form",
              partial: "form",
              locals: { asset: @asset })
          end

          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    private

    def asset_params
      params.require(:employee_asset).permit(:user_id, :asset_type, :approximate_purchase_date,
        :model_number, :serial_number, :mac_address, :phone_number, :serial_number, :retired)
    end

    def set_assets
      if params[:user_id].present?
        @user = User.find(params[:user_id])
        @assets = @user.employee_assets.active
        @retired_assets = @user.employee_assets.retired
      else
        @assets = EmployeeAsset.includes(:user).active
        @retired_assets = EmployeeAsset.includes(:user).retired
      end
    end
  end
end
