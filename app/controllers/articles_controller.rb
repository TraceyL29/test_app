class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  # edit function in edit.html
  def index
    @article = Article.all.order(id: :asc)
  end
  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice]= "Article was updated successfully"
      redirect_to article_path(@article)
    else
      #render the edit form again
      render 'edit'
    end
  end
  # POST /articles
  # POST /articles.json
  #receive from the form
  def create
    @article = Article.new(article_params)
    #article object
    #render plain: @article
    if @article.save
      #rails will extract the article id from the path
      flash[:notice]= 'Article was created successfully.'
      redirect_to article_path(@article)
    else
     render 'new'
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
#  def update
#    respond_to do |format|
#      if @article.update(article_params)
#        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
#        format.json { render :show, status: :ok, location: @article }
#      else
#        format.html { render :edit }
#        format.json { render json: @article.errors, status: :unprocessable_entity }
#      end
#    end
#  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  #def destroy
  #  @article.destroy
  #  respond_to do |format|
  #    format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
#  end
  def destroy
    #delete the article with the attached id
    @article.destroy
    redirect_to articles_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
   end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
