class Administration::OrdersController < AdministrationController
    before_filter :confirm_logged_in
    before_action :set_order, only: [:show, :evade]

    def index
        @orders = Order.all
    end

    def show
    end


    def evade
        if @order.evaded
            redirect_to administration_order_path(@order), notice: 'Order was already evaded'
            return
        end
        success = true
        Order.transaction do
            @order.orderLines.each do |line|
                if line.quantity > line.product.quantity
                    success = false
                    raise ActiveRecord::Rollback
                end

                line.product.quantity -= line.quantity
                line.product.save!
            end
            @order.update(:evaded => true)
        end

        respond_to do |format|
            if success
                format.html { redirect_to administration_order_path(@order), notice: 'Order was successfully updated.' }
                format.json { render :show, status: :ok, location: administration_order_path(@order) }
            else
                format.html { redirect_to administration_order_path(@order), alert: 'Out of quantity.' }
                format.json { render json: @order.errors, status: :unprocessable_entity }
            end
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_order
            @order = Order.find(params[:id])
        end
end