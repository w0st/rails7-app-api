class CurrencyConverter
  def initialize(lookup:)
    @lookup = lookup
  end

  def version
    '0.1'
  end

  def convert_to_pln(amount, currency)
    lookup.get_rate(currency) * amount
  end

  private

  attr_reader :lookup
end
