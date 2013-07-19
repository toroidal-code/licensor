Licensor::App.controllers :repos do

  get :index do
    # Pull the authorization_code out of the response
    code = params[:code]
    
    # Make a request to the access_token_uri endpoint to get an access_token
    access_token = settings.client.auth_code.get_token(code, params: {scope: 'public_repo'}).token
    @client = Octokit::Client.new(login: 'me', oauth_token: access_token)    
    # Use the access_token as you would a regular live-mode API key
    render '/repos/index'
  end


  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  

end
