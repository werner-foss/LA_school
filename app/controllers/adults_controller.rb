class AdultsController < ApplicationController
  before_action :set_adult, only: [:show, :edit, :update, :destroy]
  layout "adult"
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all, message: "Access denied"

  # GET /adults
  # GET /adults.json
  def index
    @adults = Adult.by_position
    @page_title = "Courses for adult learners"
  end
  
  def sort
    params[:order].each do |key, value|
      Adult.find(value[:id]).update(position: value[:position])
    end

    render nothing: true
  end

  # GET /adults/1
  # GET /adults/1.json
  def show
    @page_title = @adult.title
  end

  # GET /adults/new
  def new
    @adult = Adult.new
  end

  # GET /adults/1/edit
  def edit
  end

  # POST /adults
  # POST /adults.json
  def create
    @adult = Adult.new(adult_params)

    respond_to do |format|
      if @adult.save
        format.html { redirect_to @adult, notice: 'The course was successfully created.' }
        format.json { render :show, status: :created, location: @adult }
      else
        format.html { render :new }
        format.json { render json: @adult.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adults/1
  # PATCH/PUT /adults/1.json
  def update
    respond_to do |format|
      if @adult.update(adult_params)
        format.html { redirect_to @adult, notice: 'The course was successfully updated.' }
        format.json { render :show, status: :ok, location: @adult }
      else
        format.html { render :edit }
        format.json { render json: @adult.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adults/1
  # DELETE /adults/1.json
  def destroy
    @adult.destroy
    respond_to do |format|
      format.html { redirect_to adults_url, notice: 'The course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adult
      @adult = Adult.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adult_params
      params.require(:adult).permit(:title, :subtitle, :body, :main_image, :thumb_image, courses_attributes: [:id, :name, :_destroy])
    end
end
