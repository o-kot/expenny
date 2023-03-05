class ReceiptFormController < ApplicationController
    def index
      @shops = Shop.all
    end

    def shop
      @receipt = Receipt.last
    end

    def products
      @receipt = Receipt.last
    end
  end
