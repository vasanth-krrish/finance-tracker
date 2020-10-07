class Stock < ApplicationRecord

  def self.new_lookup(company)
    uri = URI("https://financialmodelingprep.com/api/v3/quote-short/" +
              company.upcase + "?apikey=" + Rails.application.credentials.fmp[:api_key])
    response = JSON.parse(Net::HTTP.get(uri))
    return response[0]["price"]
  end

end
