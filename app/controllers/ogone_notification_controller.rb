class OgoneNotificationController < ApplicationController
  class OgoneFailed < StandardError; end
  
  include ActiveMerchant::Billing::Integrations

  def show
    create
  end

  def create
    integration = Billing::Ogone.current
    
    notification = Ogone::Notification.new(request.query_string)
    @order = Order.find_by_number!(notification.order_id)
    
    raise OgoneFailed unless notification.complete?
    
	unless @order.state == "complete" or @order.completed?
      @order.next!
    
		payment = Payment.create(:amount => notification.gross, :order => @order)
	   payment.payment_method = PaymentMethod.find_by_type_and_active_and_environment("Billing::Ogone", true, Rails.env)
	   payment.state = 'completed'
	   payment.save!
	   @order.next!
		
    end
    
    session[:order_id] = nil
    flash[:commerce_tracking] = I18n.t("notice_messages.track_me_in_GA")
    flash[:notice] = I18n.t('order_processed_successfully')

    redirect_to @order, {:checkout_complete => true, :order_token => @order.token}
  rescue OgoneFailed
    @order.cancel!

    session[:order_id] = nil
    flash[:error] = I18n.t('unable_to_authorize_credit_card')
    redirect_to root_path
  end
end