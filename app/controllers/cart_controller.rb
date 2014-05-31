class CartController < ApplicationController

  def index
    
  end

  def addItem
    product = Product.find(params[:id])

    cartItem = CartItem.find_by(:customer => @_current_user, :product => product) || CartItem.new(:customer => @_current_user, :product => product)
    cartItem.quantity ||= 0
    cartItem.quantity += params[:quantity] || 1
    cartItem.save!

    render nothing: true
  end

  def removeItem
    product = Product.find(params[:id])
    
    CartItem
      .find_by(:customer => @_current_user, :product => product)
      .destroy
    render nothing: true
  end

  def empty
    CartItem.delete_all(['customer_id = ?', @_current_user.id])
    render nothing: true
  end

end
