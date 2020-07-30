class ShipmentsController < ApplicationController
  before_action :set_shipment, only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin, :except => [:track, :search]
  before_action :authenticate_user!, :except => [:track, :search]



  def index
    @shipments = Shipment.all
  end

  def new
    @shipment = Shipment.new
  end

  def create
    @shipment = Shipment.new(shipment_params)

    respond_to do |format|
      if @shipment.save
        format.html { redirect_to @shipment, notice: 'Shipment was successfully created.' }
        format.json { render :show, status: :created, location: @shipment }
      else
        format.html { render :new }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @history = @shipment.histories.build
  end

  def update
    respond_to do |format|
      if @shipment.update(shipment_params)
        format.html { redirect_to @shipment, notice: 'Shipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipment }
      else
        format.html { render :edit }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name"   # Excluding ".pdf" extension.
      end
    end
  end

  def destroy
    @shipment.destroy
    respond_to do |format|
      format.html { redirect_to shipments_url, notice: 'Shipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def search
    if params[:search].present?
      @shipments = Shipment.search(params[:search])
    else
      render :text => "Please provide a tracking number", :status => :unauthorized
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment
      @shipment = Shipment.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipment_params
      params.require(:shipment).permit(:senderName, :receiverName, :destination, :trackingnumber, :shippedFrom )
    end

    def ensure_admin
      unless current_user && current_user.admin?
       render :text => "What are you doing with your life?", :status => :unauthorized
      end
    end
end
