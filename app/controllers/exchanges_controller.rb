class ExchangesController < ApplicationController
  def convert
    value = ExchangeService.new(params[:currency], params[:currency_destination], params[:quantity]).perform
    render json: {"value": value}
  end
end
