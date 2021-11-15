class ApplicationMailer < ActionMailer::Base
  default from:  "\"Captain Memo\" <mail@captain-memo.com>"
  layout 'mailer'
end
