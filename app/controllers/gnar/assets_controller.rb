module Gnar
  class AssetsController < AuthenticatedController
    before_action :set_assets, only: [:index, :create]

    def index
    end

    def new
      @asset = Asset.new
    end

    def create
      @asset = Asset.new(asset_params)

      respond_to do |format|
        if @asset.save
          format.turbo_stream

          format.html { redirect_to gnar_asset_path(@asset), notice: "Asset created!" }
        else
          format.turbo_stream do
            render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@asset)}_form",
              partial: "new_form",
              locals: { asset: @asset })
          end

          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    private

    def asset_params
      params.permit(:user_id, :asset_type, :approximate_purchase_date, :model_number,
        :serial_number, :mac_address, :phone_number, :serial_number)
    end

    def set_assets
      @assets = Asset.all.includes(:user)
    end
  end
end
