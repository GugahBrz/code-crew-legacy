class DocumentMailer < ApplicationMailer

  # FIXME: I know, it's bad.
  def document_shared_email(owner, document, permission)
    @owner = owner
    @document_title = document.title
    @recipient = permission.user
    @role = permission.role

    @url = "http://codecrew.fr/documents/#{document.id}"

    mail(to: @recipient.email, subject: 'Someone just shared a document with you!')
  end
end
