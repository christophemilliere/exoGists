require "gists/gists_books"
class GistsController < ApplicationController
  include Gists

  before_action :set_gist, only: [:show, :edit, :update, :destroy]
  before_action :company_sign?, only: [:create,:new,:edit, :update, :destroy, :show, :index]

  # GET /gists
  # GET /gists.json
  def index
    @gists = Gist.all
  end

  # GET /gists/1
  # GET /gists/1.json
  def show
  end

  # GET /gists/new
  def new
    @gist = Gist.new
  end

  # GET /gists/1/edit
  def edit
  end

  # POST /gists
  # POST /gists.json
  def create
    @gist = Gist.new(gist_params)

    respond_to do |format|
      if @gist.save
        format.html { redirect_to @gist, notice: 'Gist was successfully created.' }
        format.json { render :show, status: :created, location: @gist }
      else
        format.html { render :new }
        format.json { render json: @gist.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_gists
    puts params.inspect
    if params[:login] && params[:pwd]
      user = Gists::GistsBook.new("#{params[:login]}","#{params[:pwd]}")
      if user.get_gists_all
        flash[:error] = ""
        save_gists(user)
      else
        flash[:error] = "Vous n'avez pas de gists"
      end
    end
  end

  # PATCH/PUT /gists/1
  # PATCH/PUT /gists/1.json
  def update
    respond_to do |format|
      if @gist.update(gist_params)
        format.html { redirect_to @gist, notice: 'Gist was successfully updated.' }
        format.json { render :show, status: :ok, location: @gist }
      else
        format.html { render :edit }
        format.json { render json: @gist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gists/1
  # DELETE /gists/1.json
  def destroy
    @gist.destroy
    respond_to do |format|
      format.html { redirect_to gists_url, notice: 'Gist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #search
  def search
     if params[:search]
       @search = Gist.search(params[:search])
     else
       @search = nil
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gist
      @gist = Gist.find(params[:id])
    end

    def save_gists(user)
      cpt = 0
      count = user.gists_count
      user.get_gists_all.each do |g|
        @gists = Gist.new
        @gists.user = user.get_user.login
        @gists.avatar = user.get_user.avatar_url
        @gists.name = user.get_name_all_gists[cpt]
        @gists.gists_id = g.id
        @gists.company_id = current_company.id
        cpt = +1
        @gists.save!
        if count == cpt
          redirect_to gists_path
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gist_params
      params.require(:gist).permit(:name, :user, :avatar, :gists_id, :company_id, :category_id)
    end

    def company_sign?
      if !current_company
        redirect_to '/', status: :found, notice: "Vous n'avez pas le droit ou pas access à cette page"
      end
    end

end
