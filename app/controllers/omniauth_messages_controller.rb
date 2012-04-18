class OmniauthMessagesController < ApplicationController
  # GET /omniauth_messages
  # GET /omniauth_messages.json
  def index
    @omniauth_messages = OmniauthMessage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @omniauth_messages }
    end
  end

  # GET /omniauth_messages/1
  # GET /omniauth_messages/1.json
  def show
    @omniauth_message = OmniauthMessage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @omniauth_message }
    end
  end

  # GET /omniauth_messages/new
  # GET /omniauth_messages/new.json
  def new
    @omniauth_message = OmniauthMessage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @omniauth_message }
    end
    
      access_token = OAuth::AccessToken.new(consumer, session[:access_token],session[:access_token_secret])
      url="http://api.t.sina.com.cn/statuses/update.xml"
      message="test"
      response = access_token.request(:post, url, :status=>message)
  end

  # GET /omniauth_messages/1/edit
  def edit
    @omniauth_message = OmniauthMessage.find(params[:id])
  end

  # POST /omniauth_messages
  # POST /omniauth_messages.json
  def create
    @omniauth_message = OmniauthMessage.new(params[:omniauth_message])

    respond_to do |format|
      if @omniauth_message.save
        format.html { redirect_to @omniauth_message, notice: 'Omniauth message was successfully created.' }
        format.json { render json: @omniauth_message, status: :created, location: @omniauth_message }
      else
        format.html { render action: "new" }
        format.json { render json: @omniauth_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /omniauth_messages/1
  # PUT /omniauth_messages/1.json
  def update
    @omniauth_message = OmniauthMessage.find(params[:id])

    respond_to do |format|
      if @omniauth_message.update_attributes(params[:omniauth_message])
        format.html { redirect_to @omniauth_message, notice: 'Omniauth message was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @omniauth_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /omniauth_messages/1
  # DELETE /omniauth_messages/1.json
  def destroy
    @omniauth_message = OmniauthMessage.find(params[:id])
    @omniauth_message.destroy

    respond_to do |format|
      format.html { redirect_to omniauth_messages_url }
      format.json { head :ok }
    end
  end
end
