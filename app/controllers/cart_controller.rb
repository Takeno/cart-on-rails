class CartController < ApplicationController
  before_filter :confirm_logged_in
  before_action :set_cart_item, only: [:addItem, :subtractItem, :removeItem]

  # GET /cart
  def index
    @cartItems = CartItem.where(:customer => @_current_user)
  end



  # GET /cart/add-item/1
  def addItem
    updateQuantity(params[:quantity] || 1)

    respond_to do |format|
      if @cartItem.save!
        format.html { redirect_to :cart, notice: 'Item successfully added.' }
      else
        format.html { redirect_to :cart, error: 'Cannot add item to cart.' }
        format.json { render json: cartItem.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /cart/sub-item/1
  def subtractItem
    updateQuantity((params[:quantity] || 1) * -1)

    if @cartItem.destroyed?
      return
    end

    respond_to do |format|
      if @cartItem.save!
        format.html { redirect_to :cart, notice: 'Item successfully subtracted.' }
      else
        format.html { redirect_to :cart, error: 'Cannot subtract item to cart.' }
        format.json { render json: cartItem.errors, status: :unprocessable_entity }
      end
    end
  end

  def removeItem
    respond_to do |format|
      if @cartItem.destroy
        format.html { redirect_to :cart, notice: 'Item successfully removed from cart.' }
      else
        format.html { redirect_to :cart, error: 'Cannot remove item from cart.' }
        format.json { render json: @cartItem.errors, status: :unprocessable_entity }
      end
    end
  end

  def empty
    CartItem.delete_all(['customer_id = ?', @_current_user.id])
    render nothing: true
  end


  private

    def updateQuantity(qta)
      @cartItem.quantity += qta || 1

      if @cartItem.quantity < 1
        removeItem
      end

    end

    def set_cart_item
      product = Product.find(params[:id])
      
      if product === nil
        redirect_to :cart, error: 'That product doesn\'t exist'
      end

      # Cerco il cartItem nel database
      @cartItem = CartItem.find_by(:customer => @_current_user, :product => product)
      # Se non esiste ne creo uno nuovo
      @cartItem ||= CartItem.new(:customer => @_current_user, :product => product)

      @cartItem.quantity ||= 0
    end

end
