class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    #gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    #@order = Order.new
    @order_address = OrderAddress.new
  end

  def new
    #@order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
      #pay_item
    if @order_address.valid?
      @order_address.save
      return redirect_to root_path
    else
      #gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipality, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  #def pay_item
    #Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    #Payjp::Charge.create(
      #amount: order_params[:price],  # 商品の値段
      #card: order_params[:token],    # カードトークン
      #currency: 'jpy'                 # 通貨の種類（日本円）
    #)
  #end
end
