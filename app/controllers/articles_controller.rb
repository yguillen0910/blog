class ArticlesController < ApplicationController
    before_action :find_article, except: [:new, :create, :index, :from_author]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :show, :destory]
    def index
        @articles = Article.all
    end
    def show
    end
    def edit        
    end
    def update
        @article.update(
            article_params
        )
        redirect_to @article
    end
    def destroy
        @article.destroy
        redirect_to root_path
    end
    def new
        @article = Article.new
    end
    def create
        @article = current_user.articles.create(
            article_params
        )
        redirect_to @article
    end 
    def find_article
        @article = Article.find(params[:id])
    end 
    def from_author
        @user = User.find(params[:user_id])
    end
    def article_params
        params.require(:article).permit(:title, :content)
    end
end
