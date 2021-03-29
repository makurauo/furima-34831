class PurchasesController < ApplicationController
  #before_action :rack_items, only: :index

  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def create

    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

    def purchase_params
      params.require(:purchase_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number)
                                               .merge(user_id: current_user.id,item_id: params[:item_id])
    end

#def rack_items
  #   @purchase_address = PurchaseAddress.find(params[:item_id])
  #   if current_user.id == @purchase_address.user.id
  #   redirect_to root_path
  #   end
  #end

  end

