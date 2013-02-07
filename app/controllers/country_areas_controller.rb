class CountryAreasController < ApplicationController
  # GET /country_areas
  # GET /country_areas.json
  def index
    @country_areas = CountryArea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @country_areas }
    end
  end

  # GET /country_areas/1
  # GET /country_areas/1.json
  def show
    @country_area = CountryArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @country_area }
    end
  end

  # GET /country_areas/new
  # GET /country_areas/new.json
  def new
    @country_area = CountryArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @country_area }
    end
  end

  # GET /country_areas/1/edit
  def edit
    @country_area = CountryArea.find(params[:id])
  end

  # POST /country_areas
  # POST /country_areas.json
  def create
    @country_area = CountryArea.new(params[:country_area])

    respond_to do |format|
      if @country_area.save
        format.html { redirect_to @country_area, notice: 'Country area was successfully created.' }
        format.json { render json: @country_area, status: :created, location: @country_area }
      else
        format.html { render action: "new" }
        format.json { render json: @country_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /country_areas/1
  # PUT /country_areas/1.json
  def update
    @country_area = CountryArea.find(params[:id])

    respond_to do |format|
      if @country_area.update_attributes(params[:country_area])
        format.html { redirect_to @country_area, notice: 'Country area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @country_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /country_areas/1
  # DELETE /country_areas/1.json
  def destroy
    @country_area = CountryArea.find(params[:id])
    @country_area.destroy

    respond_to do |format|
      format.html { redirect_to country_areas_url }
      format.json { head :no_content }
    end
  end
end
