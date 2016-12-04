require 'sinatra'
require 'pony'

post '/sendEmail' do
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
end