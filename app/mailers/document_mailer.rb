class DocumentMailer < ApplicationMailer

  # FIXME: I know, base_url, etc, it's not good.
  def document_shared_email(owner, document, permission)
    @owner = owner
    @document_title = document.title
    @recipient = permission.user
    @role = permission.role

    base_url = Rails.env.production? ? 'http://codecrew.fr/' : 'http://localhost:3000/'
    @url = base_url + "documents/#{document.id}"

    mail(to: @recipient.email, subject: 'Someone just shared a document with you!')
  end
end
