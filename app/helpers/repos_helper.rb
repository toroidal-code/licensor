# Helper methods defined here can be accessed in any controller or view in the application

Licensor::App.helpers do
  def is_licensed?(repo)
    Octokit.contents(repo).any? { |file| /license/i =~ file['name'] }
  end

  def page_title
    [@title, 'Licensor'].compact.join ' | '
  end

  def repository_list
    repositories = Octokit.repos params[:username], type: 'owner', sort: 'pushed'
    repository_names = repositories.map { |repo| repo['full_name'] }
    partial 'repos/repo', collection: repository_names
  rescue
    redirect 'errors/nouser'
  end
end
