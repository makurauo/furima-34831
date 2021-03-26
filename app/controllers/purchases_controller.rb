class PurchasesController < ApplicationController

def index
end

def create
end

private

def purchase_params
  params.require(:purchase).permit(:user_id, :item_id)
end

end
