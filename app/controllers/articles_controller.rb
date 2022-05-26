class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    # @article = Article.find(params[:id])
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

  def edit
    # @article = Article.find(params[:id])
  end
  
  def create
    # @article = Article.new(params.require(:article).permit(:title, :description))
    # change with private method
    @article = Article.new(article_params)

    # add validation if
    if @article.save
      # show message after succesfully saving, flash :key = "value"
      flash[:notice] = "Article was created successfully"
      redirect_to @article
    else 
      render 'new'
    end

  end  

  def update
    # find article to edit
    # @article = Article.find(params[:id])

    # update existing article
    # if @article.update(params.require(:article).permit(:title, :description))
    if @article.update(article_params)

      # if true show msg and go to the page article
      flash[:notice] = "Article was updated successfully!"
      redirect_to @article
    else
      # show edit page again to correct again
      render 'edit'
    end

  end

  def destroy
    # find article to delete
    # @article = Article.find(params[:id])

    @article.destroy
    redirect_to articles_path, status: :see_other
    
  end


  # use only inside of this controller, DRY
  # always should be on the bottom of controller code after all methods,
  # no needs to use "end" 
  private

  def set_article
    @article = Article.find(params[:id])    
  end

  def article_params
    params.require(:article).permit(:title, :description)    
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
