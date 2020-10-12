class Stock < ApplicationRecord

  def self.new_lookup(company)
    begin
      uri = URI("https://financialmodelingprep.com/api/v3/profile/" +
                company.upcase + "?apikey=" + Rails.application.credentials.fmp[:api_key])
      response = JSON.parse(Net::HTTP.get(uri))
    rescue => exception
      return nil
    end
    if response.empty?
      return nil
    else
      new(ticker: company, name: response[0]["companyName"], last_price: response[0]["price"])
    end
  end

end
