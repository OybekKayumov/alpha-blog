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
    # initial new article, so no error if we have problem with validating
    # saving block in new.html.erb
    @article = Article.new
  end
  
  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    # add validation if
    if @article.save
      # show message after succesfully saving, flash :key = "value"
      flash[:notice] = "Article was created successfully"
      redirect_to @article
    else 
      render 'new'
    end

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


# render plain: params[:article]
# @article = Article.new(params[:article])
    
# render plain: @article.inspect

    
# redirect saved article o show page
# redirect_to article_path(@article)
# shortend path
