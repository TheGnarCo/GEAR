class AssetsController < AuthenticatedController
  def index
    @assets = Asset.all.includes(:user)
  end
end
