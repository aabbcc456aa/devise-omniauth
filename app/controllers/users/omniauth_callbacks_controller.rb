# coding: utf-8 
require 'multi_json'
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
#  
#  def sina
#    user,commit_type,provider = User.find_for_oauth(request.env["omniauth.auth"], current_user)
#    session[:provider] = provider
#    session[:user] = user
#    session[:commit_type]=commit_type
#    redirect_to root_path
#  end

  
  
  ["douban","sina","tsohu","t163","tqq"].each do |provider|
    class_eval %Q{
        def #{provider}
          puts "------#{provider}-----------start--------------info"
          puts request.env["omniauth.auth"]
          puts "---------#{provider}------end----------------info"
          user,commit_type,provider = User.find_for_oauth(request.env["omniauth.auth"], current_user)
          session[:provider] = provider
          session[:user] = user
          session[:commit_type]=commit_type
          if commit_type == "regist"
            redirect_to new_registration_path(user) 
          else
            redirect_to root_path
          end
          
         end
    }

  end
end