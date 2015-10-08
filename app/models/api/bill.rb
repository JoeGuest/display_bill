require 'json'
require 'net/http'

module API
  class Bill
    def self.get
      new.get
    end

    def get
      JSON.parse(response)
    end

    private

    def response
      Net::HTTP.get(uri)
    end

    def uri
      URI("http://safe-plains-5453.herokuapp.com/bill.json")
    end
  end
end
