class TasksController < ApplicationController
  before_action :set_list, only: [:edit, :update, :destroy]

  def task_path
    list_task_path
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    save_params = task_params
    save_params["list_id"] = params[:list_id]
    task = Task.new(save_params)
    list = List.find(params[:list_id])

    respond_to do |format|
      if task.save
        format.html { redirect_to list, notice: 'Task was successfully created.' }
        format.json { render action: 'show', status: :created, location: list }
      else
        format.html { render action: 'new' }
        format.json { render json: list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      save_params = task_params
      save_params["list_id"] = params[:list_id]
      if @task.update(save_params)
        format.html { redirect_to @list, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    task = @task
    @task.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: "#{task.task} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @task = Task.find_by :id => params[:id], :list_id => params[:list_id]
      @list = List.find_by :id => params[:list_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:task)
    end
end
