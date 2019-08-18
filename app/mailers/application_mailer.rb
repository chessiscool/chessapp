# frozen_string_literal: true

# ApplicationMailer is the default mailer
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
