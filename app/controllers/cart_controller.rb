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
        format.html { redirect_to :cart, alert: 'Cannot add item to cart.' }
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
        format.html { redirect_to :cart, alert: 'Cannot subtract item to cart.' }
        format.json { render json: cartItem.errors, status: :unprocessable_entity }
      end
    end
  end

  def removeItem
    respond_to do |format|
      if @cartItem.destroy
        format.html { redirect_to :cart, notice: 'Item successfully removed from cart.' }
      else
        format.html { redirect_to :cart, alert: 'Cannot remove item from cart.' }
        format.json { render json: @cartItem.errors, status: :unprocessable_entity }
      end
    end
  end

  def empty
    respond_to do |format|
      if CartItem.delete_all(['customer_id = ?', @_current_user.id])
        format.html { redirect_to :cart, notice: 'All items are removed.' }
      else
        format.html { redirect_to :cart, alert: 'Cannot remove all items from cart.' }
        format.json { render json: cartItem.errors, status: :unprocessable_entity }
      end
    end
  end



  def checkout
    cartItems = CartItem.includes([:product]).where(:customer => @_current_user)
    order = Order.new(:customer => @_current_user, :evaded => false)

    CartItem.transaction do
      cartItems.each do |item|

        # Creo la riga d'ordine
        row = OrderLine.new(
          :order => order,
          :quantity => item.quantity,
          :unitPrice => item.product.price,
          :product => item.product
        )

        # Salvo la nuova riga d'ordine
        row.save!
        # Distruggo l'oggetto dal carrello
        item.destroy!
      end

      order.save!
    end

    redirect_to :cart, notice: 'Order created'
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
        redirect_to :cart, alert: 'That product doesn\'t exist'
      end

      # Cerco il cartItem nel database
      @cartItem = CartItem.find_by(:customer => @_current_user, :product => product)
      # Se non esiste ne creo uno nuovo
      @cartItem ||= CartItem.new(:customer => @_current_user, :product => product)

      @cartItem.quantity ||= 0
    end

end
