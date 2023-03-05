class IndexController < ApplicationController
  def index
    @PurchasedItems = PurchasedItem.all
  end
end
