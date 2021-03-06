class BoardsController < ApplicationController
  add_crumb 'Board'
  
  ## GET /boards
  ## GET /boards.json
  #def index
  #  @boards = Board.all

  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.json { render json: @boards }
  #  end
  #end

  # GET /boards/list/:country_id
  # GET /boards/list/:country_id.json
  def list
    @boards = Board.find_all_by_country_id(params[:country_id], order: "created_at desc")
    @country = Country.find_by_id(params[:country_id])

    # jump to root if country_id is invalid
    if @boards == nil or @country == nil
        return redirect_to controller: :countries, action: :index
    end
                                           
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @boards }
    end
  end

  # GET /boards/1
  # GET /boards/1.json
  #def show
  #  @board = Board.find(params[:id])

  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.json { render json: @board }
  #  end
  #end

  # GET /boards/new
  # GET /boards/new.json
  def new
    @board = Board.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @board }
    end
  end

  # GET /boards/cut/:country_id
  # GET /boards/cut/:country_id.json
  def cut
      @board = Board.new
      @country = Country.find_by_id(params[:country_id])

      # jump to root if country_id is invalid
      if @country == nil
          return redirect_to controller: :countries, action: :index
      end

      respond_to do |format|
          format.html
          format.json { render json: @board }
      end
  end

  # GET /boards/1/edit
  #def edit
  #  @board = Board.find(params[:id])
  #end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(params[:board])

    respond_to do |format|
      if @board.save
        @board.id = @board.country_id
        format.html { redirect_to board_list_path(@board), action: :list, notice: 'Board was successfully created.' }
        format.json { render json: @board, params => {:country_id => params[:country_id]}, action: :list, status: :created, location: @board }
      else
        #format.html { render action: "new" }
        @board.id = params[:board][:country_id]
        format.html { redirect_to board_list_path(@board), action: :list, notice: 'Board was NOT created.' }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /boards/1
  # PUT /boards/1.json
  #def update
  #  @board = Board.find(params[:id])

  #  respond_to do |format|
  #    if @board.update_attributes(params[:board])
  #      format.html { redirect_to @board, notice: 'Board was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @board.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /boards/1
  # DELETE /boards/1.json
  #def destroy
  #  @board = Board.find(params[:id])
  #  @board.destroy

  #  respond_to do |format|
  #    format.html { redirect_to boards_url }
  #    format.json { head :no_content }
  #  end
  #end
end
