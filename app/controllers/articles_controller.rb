class ArticlesController < ApplicationController
  include ArticlesHelper
  def index
    @article = Article.all
  end
  def show
    @article = Article.find(params[:id])
    flash.notice = "Article '#{@article.title}' Updated!"
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Article '#{@article.title}' Created!"
    redirect_to article_path(@article)
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article '#{@article.title}' Removed!"
    redirect_to articles_url
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    redirect_to article_path(@article)
  end
end
