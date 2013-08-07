Licensor::App.controllers do
  configure do
    Octokit.client_id = ENV['CLIENT_ID']
    Octokit.client_secret = ENV['CLIENT_SECRET']
  end

  get '/' do
    render 'index'
  end
end
