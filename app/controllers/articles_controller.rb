class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

end

# turn to instance variable
# @ converts regular variable into instance variable
# @article
# now @article instance variable is available in show.html.erb file

# byebug