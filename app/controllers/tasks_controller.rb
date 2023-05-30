class TasksController < ApplicationController
   before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    # список задач текущего пользователя
    @tasks = Task.ordered.where(user_id: current_user.id)

    # проверяем каждую задачу на достижение даты
    @tasks.each do |task|
      if task.date.present? && task.date.strftime("%Y-%m-%d %H:%M") == (Date.today - 1.day).strftime("%Y-%m-%d 11:00")
        # воспроизводим звуковой сигнал
        system("afplay /System/Library/Sounds/Glass.aiff")

        # или показываем всплывающее окно
        system("osascript -e 'display notification \"#{task.name}\" with title \"Task Alert\"'")
      end
    end
  end

  def show; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user 

    if @task.save
      respond_to do |format|
        format.html { redirect_to } 
        format.turbo_stream
      end
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    
    respond_to do |format| 
      format.html { redirect_to tasks_path } 
      format.turbo_stream
    end

  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :date, :description)
  end

end
