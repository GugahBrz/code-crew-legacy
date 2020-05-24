# frozen_string_literal: true

# test_mailer.rb
class TestMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.test_mailer.test.subject
  #
  def test
    @greeting = 'Hello from TestMailer'

    mail to: 'gustavo@codecrew.fr'
  end
end
