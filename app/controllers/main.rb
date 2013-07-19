Licensor::App.controllers do
  configure do
    options = {
      site: 'https://github.com/',
      authorize_url: '/login/oauth/authorize',
      token_url: '/login/oauth/access_token',
    }
      
    set :client, OAuth2::Client.new(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], options)
  end
  
  get '/authorize' do
    params = {
      scope: 'public_repo',
    }  
    
    # Redirect the user to the authorize_uri endpoint
    redirect settings.client.auth_code.authorize_url(params)
  end

  get "/" do
    render 'index'
  end
end
