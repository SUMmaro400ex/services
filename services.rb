require 'sinatra'
require 'pony'
require 'json'

get '/sendEmail' do
  Pony.mail :to => params[:to_email],
            :from => params[:email],
            :subject =>  params[:subject],
            :body =>  params[:body],
            :via => :smtp,
            :via_options => {
                :address              => 'smtp.gmail.com',
                :port                 => '587',
                :user_name            => ENV['GMAIL_USER'],
                :password             => ENV['GMAIL_PASSWORD'],
                :authentication       => :plain, 
                :domain               => "JonRose.co" 
              }
    callback = params.delete('callback') # jsonp
    json = {'response' => 'true'}.to_json

    if callback
      content_type :js
      response = "#{callback}(#{json})" 
    else
      content_type :json
      response = json
    end
    response

end