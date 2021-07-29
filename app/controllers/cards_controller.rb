class CardsController < ApplicationController
  def new
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer = Payjp::Customer.create(
      description: "test", # テストカードであることを説明
      card: params[:card_token], # 登録しようとしているカード情報
    )
    card = Card.new( # 顧客トークンとログインしているユーザーを紐付けるインスタンスを生成
      customer_token: customer.id, # 顧客トークン
      user_id: current_user.id, # ログインしているユーザー
    )
    card.save
    redirect_to root_path
  end
end
