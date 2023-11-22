class CurrencyLookup
  def initialize(dependency)
    @dependency = dependency
  end

  def get_rate(currency)
    dependency.call(123, 456, currency)
  end

  private

  attr_reader :dependency
end
