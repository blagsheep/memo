class PostsController < ApplicationController
  before_action :authenticate_user! , only: [:index, :edit, :new, :create, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_permission, only: [:edit, :update, :destroy]
  
  # GET /posts
  def index
    # avoid N+1 query: https://edgeguides.rubyonrails.org/action_text_overview.html#avoid-n-1-queries
    @posts = Post.all.with_rich_text_body_and_embeds.order(created_at: :desc)
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.user_id
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post, notice: t('posts.successfully_created')
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: t('posts.successfully_updated')
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to root_url, notice: t('posts.successfully_destroyed')
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :summary, :date, :photo, :user_id)
    end

    def require_permission
      if current_user != Post.find(params[:id]).user
        redirect_to root_path, notice: t('posts.not_allowed_to_edit')
      end
    end
end
