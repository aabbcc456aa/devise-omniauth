class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :token_authenticatable, :lockable, :confirmable,
    :omniauthable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :image_url, :nick
  #omniauth account
  attr_accessible :sina_uid, :sina_oauth_token_secret, :sina_oauth_token
  attr_accessible :tsohu_uid, :tsohu_oauth_token_secret, :tsohu_oauth_token
  attr_accessible :t163_uid, :t163_oauth_token_secret, :t163_oauth_token
  attr_accessible :tqq_uid, :tqq_oauth_token_secret, :tqq_oauth_token
  attr_accessible :douban_uid, :douban_oauth_token_secret, :douban_oauth_token
  attr_accessible :qzone_uid, :qzone_oauth_token_secret, :qzone_oauth_token
  
  def puts_array
    self.each do |t|
      puts t
      puts_array
    end
  end
  
  def self.puts_hash_or_array(value)
    if value.class == Hash
      value.each do |key,key_value|
        puts "#{key}-----value:#{key_value}"
        puts_hash_or_array(key_value)
      end
    elsif value.class == Array
      value.each do |t|
        puts t
        puts_hash_or_array(t)
      end
    
    else
      puts value
    end
  end
    
  
  def self.find_for_oauth(auth, signed_in_resource=nil)
    provider = auth["provider"]
    commit_type = "login"
    uid = auth["uid"]
    nick = auth['info']['nickname']
    
    user = nil
    if provider == 'sina'
      user = User.find_by_sina_uid(uid)
    elsif provider == 'tsohu' || provider == 't163' || provider == 'tqq'
      user = User.find_by_nick(nick)
    end
    
    if user.blank?
      commit_type = "regist"
      oauth_token = auth['credentials']['token']
      oauth_token_secret = auth['credentials']['secret']
      location = auth['info']['location']
      name = auth['info']['name']
      nick = auth['info']['nickname']
      image_url = auth['info']['image']
      user = User.new(:name => name,:image_url => image_url)
      eval("user.#{provider}_uid = uid")
      eval("user.#{provider}_oauth_token = oauth_token")
      eval("user.#{provider}_oauth_token_secret = oauth_token_secret")
      
      puts name
      puts nick
      puts image_url
      puts location
    end
    puts "================="
   
    eval("puts user.#{provider}_uid")
    eval("puts user.#{provider}_oauth_token")
    eval("puts user.#{provider}_oauth_token_secret")
   
    return [user,commit_type,provider]
  end


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.sina_data"] && session["devise.sina_data"]["extra"]["raw_info"]
        user.email = data["email"]
      end
    end
  end
end
