class ArticlesController < ApplicationController

  def new
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article  #  если использовать Редирект - то  вывод представления из create  отображатьсяя не будет
      # будет делаться редирект на роутер SHOW - файл Креате можно удалить с редиректом он не используется
    else
      render action: 'new'
    end
  end

  def edit
    @article = Article.find(params[:id]) # Для того что бы отредактировать , нужно получить Сущьность (переменная обьект)
    # И передать ей все ее свойства, только после этого сущьность можно изменить. Представление edit.html.erb
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

  # все что ниже Приватного метода не имеет доступа из вне.
  # Далее идет разрешение доступа к запретным атрибутам емайл и контакт
  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end