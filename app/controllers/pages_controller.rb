class PagesController < ApplicationController

  before_action :authenticate_user! , only: [:todo]

  def home
    #NotificationMailer.with(message: "My dear reader, this is a test!").notify_admin.deliver_later

    @posts = Post.all

  end

  def todo
  end

end
