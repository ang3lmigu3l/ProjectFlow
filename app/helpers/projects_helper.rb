module ProjectsHelper

  def percent_completed(user)
    if user.projects.count > 0
    total_projects = user.projects.count
    completed_projecs = user.projects.completed.count
      i = completed_projecs * 100
     percent = i / total_projects
   end
     return percent
  end

  def projects_are_present
    current_user.projects.count > 0
  end

end
