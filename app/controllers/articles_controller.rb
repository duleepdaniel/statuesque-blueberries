# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]

  def index
    @articles = Article.order(published_at: :desc)
    render json: @articles
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @article
  end

  def destroy
    render status: :method_not_allowed
  end

  def update
    render status: :method_not_allowed
  end

  private

  def set_article
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Article not found' }, status: :not_found
  end

  def article_params
    params.permit(:title, :content, :author, :category, :published_at)
  end
end
