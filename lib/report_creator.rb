class ReportCreator
  def initialize(mailer:)
    @mailer = mailer
  end

  def generate(email)
    # A lot of code here...
    send_notification(email)
  end

  private

  attr_reader :mailer

  def send_notification(email)
    mailer.send_email(email)
  end
end
