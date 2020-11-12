class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        render 'users/my_portfolio'
      else
        flash[:alert] = "You must enter a valid symbol"
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = "You must enter a symbol"
      redirect_to my_portfolio_path
    end
  end

end
