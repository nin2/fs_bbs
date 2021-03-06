class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :list, :show]
  
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/:board_id
  # GET /comments/:board_id.json
  def list
    @comments = Comment.find_all_by_board_id(params[:board_id])
    @board = Board.find_by_id(params[:board_id])
    @country = Country.find_by_id(@board.country_id)

    # jump to root if country_id is invalid
    if @comments == nil or @country == nil
        return redirect_to controller: :countries, action: :index, notice: "URL Parameter is invalid."
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # POST /comments/post/:board_id
  # POST /comments/post/:board_id.json
  def post
    @comment = Comment.new
    @comment.board_id = params[:board_id]
                                            
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    comment_number = Comment.count(:conditions => ["board_id = ?", @comment.board_id])
    @comment.number = comment_number + 1

    respond_to do |format|
      if @comment.save
        @comment.id = @comment.board_id
        format.html { redirect_to comment_list_url(@comment), notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
