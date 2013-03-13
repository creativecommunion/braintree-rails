module BraintreeRails
  class AddressValidator < Validator
    Validations = [
      [:first_name, :last_name, :company, :street_address, :extended_address, :locality, :region, :length => {:maximum => 255}],
      [:country_code_numeric, :allow_blank => true, :inclusion => { :in => Braintree::Address::CountryNames.map {|country| country[3]} }],
      [:street_address, :presence => true, :if => Proc.new { |address| AddressValidator.validate_street_address?(address) }],
      [:postal_code, :presence => true, :format => { :with => /\A[- a-z0-9]+\z/i}, :if => Proc.new { |address| AddressValidator.validate_postal_code?(address) }]
    ]

    def self.validate_postal_code?(address)
      Configuration.require_postal_code
    end

    def self.validate_street_address?(address)
      Configuration.require_postal_code
    end
  end
end