module Gnar
  class AssetsController < AuthenticatedController
    before_action :set_assets

    def index
    end

    def new
      @asset = Asset.new
    end

    def edit
      @asset = Asset.find(params[:id])
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
              partial: "form",
              locals: { asset: @asset })
          end

          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      @asset = Asset.find(params[:id])

      respond_to do |format|
        if @asset.update(asset_params)
          format.turbo_stream

          format.html { redirect_to gnar_asset_path(@asset), notice: "Asset created!" }
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
      params.require(:gnar_asset).permit(:user_id, :asset_type, :approximate_purchase_date,
        :model_number, :serial_number, :mac_address, :phone_number, :serial_number)
    end

    def set_assets
      @assets = Asset.all.includes(:user)
    end
  end
end
