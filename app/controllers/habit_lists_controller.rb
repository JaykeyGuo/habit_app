class HabitListsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_habit_list, only: [:show, :edit, :update, :destroy]

  # GET /habit_lists
  # GET /habit_lists.json
  def index
    @habit_lists = HabitList.all
    flash[:notice] = "欢迎回来!"
  end

  # GET /habit_lists/1
  # GET /habit_lists/1.json
  def show
    @habit_list = HabitList.find(params[:id])
    @record_days = @habit_list.record_days

    @record_days = case params[:order]
      when 'reverse'
        @record_days.order("day_num DESC").reverse
      else
        @record_days.order("day_num DESC")
      end

    @habit_periods = @habit_list.habit_periods
  end

  # GET /habit_lists/new
  def new
    @habit_list = HabitList.new
    @categories = Category.all
  end

  # GET /habit_lists/1/edit
  def edit
  end

  # POST /habit_lists
  # POST /habit_lists.json
  def create
    @habit_list = HabitList.new(habit_list_params)
    @habit_list.user = current_user
    @category_id = params[:category_id]

      if @habit_list.save
        redirect_to @habit_list
        flash[:notice] = "创建成功"
      else
        render :new
      end
  end

  # PATCH/PUT /habit_lists/1
  # PATCH/PUT /habit_lists/1.json
  def update
      if @habit_list.update(habit_list_params)
        redirect_to @habit_list
        flash[:notice] = "修改已上传"
      else
        render :edit
      end
  end

  # DELETE /habit_lists/1
  # DELETE /habit_lists/1.json
  def destroy
    @habit_list.destroy
    redirect_to habit_lists_path
    flash[:alert] = "已成功删除"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_habit_list
      @habit_list = HabitList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def habit_list_params
      params.require(:habit_list).permit(:title, :description, :category_id)
    end
end
