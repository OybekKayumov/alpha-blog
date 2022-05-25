class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    # needs index.html.erb

    @articles = Article.all
  end

  # add two actions to create and new
  # and we need new views in /views/articles
  def new
    
  end
  
  def create
    # render plain: params[:article]
    # @article = Article.new(params[:article])
    @article = Article.new(params.require(:article).permit(:title, :description))
    # render plain: @article.inspect
    @article.save
    
    # redirect saved article o show page
    # redirect_to article_path(@article)
    # shortend path
    redirect_to @article

  end

  

end

# turn to instance variable
# @ converts regular variable into instance variable
# @article
# now @article instance variable is available in show.html.erb file

# byebug

# action show
# def show
#   @article = Article.find(params[:id])
# end
