class ListItemsController < ApplicationController
  before_action :set_list_item, only: %i[ show edit update destroy update_status ]

  # GET /list_items or /list_items.json
  def index
    @incomplete_list_items = current_user.incomplete_list_items
    @complete_list_items = current_user.complete_list_items
  end

  # GET /list_items/1 or /list_items/1.json
  def show
  end

  # GET /list_items/new
  def new
    @list_item = ListItem.new
  end

  # GET /list_items/1/edit
  def edit
  end

  # POST /list_items or /list_items.json
  def create
    @list_item = current_user.incomplete_list_items.build(list_item_params)

    respond_to do |format|
      if @list_item.save

        format.turbo_stream { flash.now[:notice] = "List item created successfully!" }
        format.html { redirect_to list_item_url(@list_item), notice: "List item was successfully created." }
        format.json { render :show, status: :created, location: @list_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /list_items/1 or /list_items/1.json
  def update
    respond_to do |format|
      if @list_item.update(list_item_params)
        format.html { redirect_to list_item_url(@list_item), notice: "List item was successfully updated." }
        format.json { render :show, status: :ok, location: @list_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_items/1 or /list_items/1.json
  def destroy
    @list_item.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to list_items_url, notice: "List item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # CUSTOM CONTROLLER ACTIONS ADDED BELOW THIS LINE

  # PATCH /list_items/:id/update_status
  def update_status
    if @list_item.incomplete?
      @list_item.complete!
    else
      @list_item.incomplete!
    end

    respond_to do |format|
      if @list_item.save

        format.turbo_stream { flash.now[:notice] = @list_item.name + " marked as " + @list_item.status }
        format.html { redirect_to list_items_path, notice: @list_item.name + " marked as " + @list_item.status }
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  # Filter incomplete list items by category
  def filter_list_items

    if !params[:category_id].presence
      @list_items = current_user.incomplete_list_items
    else
      @list_items = ListItem.filter_items(params[:category_id]) || []
    end

    respond_to do |format|
      format.turbo_stream
    end
  end

  # PRIVATE Controller Actions used by PUBLIC methods above
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_item
      @list_item = ListItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_item_params
      params.require(:list_item).permit(:name, :details, :due, :status, :category_id)
    end
end
