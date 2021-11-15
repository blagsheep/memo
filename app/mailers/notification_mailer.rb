class NotificationMailer < ApplicationMailer

  def notify_admin
    @message = params[:message]
    mail(
      to: email_address_with_name(ENV['MEMO_ADMIN_EMAIL'], "Administrator"),
      subject: "Notification from Captain Memo")
  end

end
