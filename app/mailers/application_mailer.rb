# frozen_string_literal: true

# application_mailer.rb
class ApplicationMailer < ActionMailer::Base
  default from: 'support@codecrew.fr'
  layout 'mailer'
end
