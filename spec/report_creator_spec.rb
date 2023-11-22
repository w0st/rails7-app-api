require 'rails_helper'

describe ReportCreator do
  subject(:instance) { described_class.new(mailer: mailer_service) }
  let(:email) { 'john@example.com' }

  # Record calls made and then assert after the fact
  context 'using spy' do
    let(:mailer_service) { spy }

    it 'sends email' do
      result = instance.generate(email)
      p "result_of_send_email_method = #{result}"
      expect(mailer_service).to have_received(:send_email).with(email).once
    end

    # NOTE: On spy you can call whatever you want
    it { mailer_service.not_existing_method }
  end

  # Expect a method which will be called in future
  context 'using mock' do
    let(:mailer_service) { double(:mailer, send_email: true) }

    before do
      allow(mailer_service)
        .to receive(:send_email)
        .with('email@untypical.com')
        .and_return(false)
    end

    it 'sends email' do
      expect(mailer_service).to receive(:send_email).with(email)
      result = instance.generate(email)
      p "result_of_send_email_method = #{result}"
      # ! NOTE:  Of course, you still can do this instead - but it's a rspec way for defining STUB:
      # expect(mailer_service).to have_received(:send_email).with(email)
      # Read more: https://martinfowler.com/bliki/TestDouble.html
    end

    # NOTE: Calling not allowed methods on mock will raise an exception
    # it { mailer_service.not_existing_method }
  end
end
