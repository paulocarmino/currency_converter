require 'spec_helper'
require './lib/exchange'

describe Currency do
  it "exchange" do
    json = JSON.parse(File.read("./spec/fixtures/currency_list.json"))
    currency, currency_destination = json['currency_list'].sample(2)
    quantity = rand(1..9999)

    value = Currency::exchange currency, currency_destination, quantity
    expec(value.is_a? Numeric and value != 0).to_eql(true)
  end
end
