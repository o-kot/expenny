class ReceiptsController < ApplicationController
  def create
    if params[:sdate].blank? || params[:name].blank?
      render plain: 'Formularz zawiera niewypełnione pola.' and return
    end
    @receipt = Receipt.new
    if @receipt.save(params['sdate'], params['name'], params['comment']) == 'success'
      session[:message]='New receit was created'
      if Shop.all.include?(@receipt[:name])
        redirect_to '/receipt/products'
      else
        redirect_to '/receipt/shop'
      end
    end
  end
end
