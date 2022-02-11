class PagesController < ApplicationController

  include Pagy::Backend
  
  before_action :authenticate_user! , only: [:todo]

  def home
    #NotificationMailer.with(message: "My dear reader, this is a test!").notify_admin.deliver_later
    # avoid N+1 query: https://edgeguides.rubyonrails.org/action_text_overview.html#avoid-n-1-queries
    
    @pagy, @posts = pagy(Post.all.with_rich_text_body_and_embeds.order(date: :desc))

    #@posts = Post.all.with_rich_text_body_and_embeds.order(created_at: :desc)

  end

  def todo
  end

end
