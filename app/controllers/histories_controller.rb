class HistoriesController < ApplicationController
  def new
    #code
  end

  def create
    @shipment = Shipment.friendly.find(params[:shipment_id])
    @history = @shipment.histories.create(params.require(:history).permit(:scan_history))

    if @history.save
      redirect_to @shipment
    else
      render 'new'
    end
  end
end
