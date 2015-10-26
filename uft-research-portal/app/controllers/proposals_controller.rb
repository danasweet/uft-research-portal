class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.all
  end

  def new 
    @proposal = Proposal.new
  end

  def create 
    @proposal = Proposal.create!(proposal_params)
    @proposal.faculty = current_user
    @proposal.save 
      if @proposal.valid?
        redirect_to proposal_path(@proposal)
      else
        redirect_to new_proposal_path
      end
  end

  def edit
  end

  def update
  end

  def show
    @proposal = Proposal.find(params[:id])
    @comments = @proposal.comments
    # @comment = Comment.new
  end

  def destroy
  end


  private

  def proposal_params
    params.require(:proposal).permit(:title, :summary, :hypothesis, :department, :active)
  end


end

#   Prefix Verb   URI Pattern                                            Controller#Action
#     proposal_experiments GET    /proposals/:proposal_id/experiments(.:format)          experiments#index
#                          POST   /proposals/:proposal_id/experiments(.:format)          experiments#create
#  new_proposal_experiment GET    /proposals/:proposal_id/experiments/new(.:format)      experiments#new
# edit_proposal_experiment GET    /proposals/:proposal_id/experiments/:id/edit(.:format) experiments#edit
#      proposal_experiment GET    /proposals/:proposal_id/experiments/:id(.:format)      experiments#show
#                          PATCH  /proposals/:proposal_id/experiments/:id(.:format)      experiments#update
#                          PUT    /proposals/:proposal_id/experiments/:id(.:format)      experiments#update
#                          DELETE /proposals/:proposal_id/experiments/:id(.:format)      experiments#destroy
#                proposals GET    /proposals(.:format)                                   proposals#index
#                          POST   /proposals(.:format)                                   proposals#create
#             new_proposal GET    /proposals/new(.:format)                               proposals#new
#            edit_proposal GET    /proposals/:id/edit(.:format)                          proposals#edit
#                 proposal GET    /proposals/:id(.:format)                               proposals#show
#                          PATCH  /proposals/:id(.:format)                               proposals#update
#                          PUT    /proposals/:id(.:format)                               proposals#update
#                          DELETE /proposals/:id(.:format)                               proposals#destroy


# class PostsController < ApplicationController

#   before_filter :authorize, :except => [:index, :show]

#   def index
#     @posts = Post.all
#   end

#   def new
#     @post = Post.new
#   end

#   def create
#     @post = Post.create!(post_params)
#     @post.author = current_user
#     @post.save
#       if @post.valid?
#         redirect_to post_path(@post)
#       else
#         redirect_to new_post_path
#       end
#   end

#   def edit
#   end

#   def update
#   end

#   def show
#     p params
#     @post = Post.find(params[:id])
#     @comments = @post.comments
#     @comment = Comment.new
#   end

#   def destroy
#   end

#   private

#   def post_params
#     params.require(:post).permit(:title, :url)
#   end
# end