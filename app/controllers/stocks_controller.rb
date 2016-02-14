class StocksController < ApplicationController
  def search
    if params[:stock]
      @stock = Stock.find_by_ticker(params[:stock])
      @stock ||= Stock.new_from_lookup(params[:stock])
    end

    if @stock
      # render json: @stock     # A good way to see if a functionality is working
      render partial: 'lookup'
    else
      render status: :not_found, nothing: true
    end
  end
end