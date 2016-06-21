class ProjectsController < ApplicationController
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
  end

  private

  def project_params
    Project.find(params[:id])
  end

  def project_permits
     params.required(:project).permit(:title, :description, :completed, :date_started, :user_id, :preview, :project_link )
  end
end
