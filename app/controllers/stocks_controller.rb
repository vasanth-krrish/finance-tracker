class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock.nil?
        flash[:alert] = "Please enter a valid symbol to search"
        redirect_to my_portfolio_path
      else
        respond_to do |f|
          f.js
        end
      end
    else
      flash[:alert] = "Please enter a symbol to search"
      redirect_to my_portfolio_path
    end
  end

  def save
    @stock = Stock.new_lookup(params[:ticker])
    @user_stock = current_user.user_stocks.build(ticker: @stock.ticker, name: @stock.name)
    if @user_stock.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @user_stock = UserStock.find(params[:id])
    @user_stock.destroy
    respond_to do |f|
      f.js
    end
  end
end
