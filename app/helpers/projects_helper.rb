module ProjectsHelper

  def percent_completed(user)
    total_projects = user.projects.count
    completed_projecs = user.projects.completed.count
      i = completed_projecs * 100
     percent = i / total_projects
     return percent
  end

end
