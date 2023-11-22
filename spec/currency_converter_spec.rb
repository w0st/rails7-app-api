require 'rails_helper'
require 'helpers/fake_lookup'

describe CurrencyConverter do
  subject(:instance) { described_class.new(lookup: lookup_service) }

  describe '#version' do
    context 'using dummy' do
      let(:lookup_service) { 'I need to pass whatever to avoid ArgumentError' }

      it { expect(instance.version).to eq('0.1') }
    end
  end

  describe '#convert' do
    context 'using stub - pure double' do
      let(:lookup_service) { double('lookup') }

      before do
        allow(lookup_service)
          .to receive(:get_rate)
          .with('EUR')
          .and_return(4.5)
        # NOTE: On pure double you can stub whatever you want
        allow(lookup_service)
          .to receive(:not_existing_method)
          .and_return(true)
      end

      it { expect(instance.convert_to_pln(2, 'EUR')).to eq(9) }
      # NOTE: Stub does not exist for USD
      # it { expect(instance.convert_to_pln(2, 'USD')).to eq(9) }
    end

    # NOTE: If you have already a representant of your dependency then it's better to use class_double/instance_double
    # They will check methods signatures automatically
    context 'using stub - verified double' do
      let(:lookup_service) { instance_double(CurrencyLookup) }

      before do
        allow(lookup_service)
          .to receive(:get_rate)
          .with('EUR')
          .and_return(4.5)
        # NOTE: Not allowed to stub not existing method on verified doubles
        # allow(lookup_service)
        #   .to receive(:not_existing_method)
        #   .and_return(true)
      end

      it { expect(instance.convert_to_pln(2, 'EUR')).to eq(9) }
    end

    context 'using fake' do
      let(:lookup_service) { FakeLookup.new }

      it { expect(instance.convert_to_pln(2, 'EUR')).to eq(9) }
      it { expect(instance.convert_to_pln(2, 'dfd')).to eq(9) }
    end

    context 'using stub - partial double' do
      let(:lookup_service) { FakeLookup.new }

      # NOTE: It allows you to override partially the behaviour of the original class
      before do
        allow(lookup_service)
          .to receive(:get_rate)
          .and_call_original
        allow(lookup_service)
          .to receive(:get_rate)
          .with('USD')
          .and_return(4)
      end

      it { expect(instance.convert_to_pln(2, 'EUR')).to eq(9) }
      it { expect(instance.convert_to_pln(2, 'USD')).to eq(8) }
    end
  end
end
