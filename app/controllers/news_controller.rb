class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy, :toggle_status]

  # GET /news
  # GET /news.json
  def index
    @news = News.all
    @page_title = "LAschool news"
  end

  # GET /news/1
  # GET /news/1.json
  def show
     @page_title = @news.title
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(news_params)

    respond_to do |format|
      if @news.save
        format.html { redirect_to @news, notice: 'An item was successfully created.' }
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to @news, notice: 'An item was successfully updated.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url, notice: 'An item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def toggle_status
    if @news.draft?
      @news.published!
    else @news.published?
      @news.draft!
    end
    redirect_to news_url, notice: 'An item status has been updated.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:title, :subtitle, :body, :small_image)
    end
end
