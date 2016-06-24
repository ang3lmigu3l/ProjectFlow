class ProjectsController < ApplicationController

  before_action :authenticate_user!, :only => [:create , :new , :edit ]
  before_action :authorized_user , :only => [:create, :edit , :destroy]

  def show
    @project = project_params
  end

  def create
    @user = current_user
    @project = @user.projects.new(project_permits)

    if @project.save
      flash[:notice] = "New Project was saved successfully."
      redirect_to @project
    else
      flash[:alert] = "Unable to save Project, Please try again."
      render :new
    end

  end

  def new
    @project = Project.new

  end

  def edit
    @project = project_params
  end

  def update
    @project = project_params
    @project.assign_attributes(project_permits)

    if @project.save
      flash[:notice] = "Project Updated "
      redirect_to @project
    else
      flash[:alert] = "Project unable to Update. please try again "
      render :edit
    end
  end

  def destroy
    @project = project_params
    @user = current_user

    if @project.destroy
      flash[:notice] = "#{@project.title} was deleted"
      redirect_to @user
    else
      flash[:alert] = "Project was not deleted "
      redirect_to @project_path
    end




  end

  private

  def authorized_user
    project = Project.find(params[:id])

    unless project.user_id == current_user.id
      flash[:alert] = "Sorry you cannot do that!"
      redirect_to project_path
    end
  end

  def project_params
    Project.find(params[:id])
  end

  def project_permits
     params.required(:project).permit(:title, :description,:body, :completed, :date_started, :user_id, :preview, :project_link )
  end
end
