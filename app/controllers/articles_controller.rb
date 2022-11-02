class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all.with_attached_images
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id]) # Для того что бы отредактировать , нужно получить Сущьность (переменная обьект)
    # И передать ей все ее свойства, только после этого сущьность можно изменить. Представление edit.html.erb
  end

  def create

 
    pp "=================="
    pp params[:blobs]
    pp "=================="
   

    @article = Article.create!(article_params)
    @article.images.attach(params[:article][:images])
   # @article.save
    if @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article  #  если использовать Редирект - то  вывод представления из create  отображатьсяя не будет
      # будет делаться редирект на роутер SHOW - файл Креате можно удалить с редиректом он не используется
    else
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :name, images: [])
  end

end