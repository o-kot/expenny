class IndexController < ApplicationController
  def index
    @PurchasedItems = PurchasedItems.all
  end
end
