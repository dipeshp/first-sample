class UsersController < ApplicationController
add_crumb("Users") { |instance| instance.send :users_path }
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @u = User.order(:name).page(params[:page]).per(4) #params[:page]#(2)#.per(2)
    respond_to do |format|
      format.html # index.html.erb
      format.js#on { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
Rails.logger.info "User is #{@user.name}.............."
add_crumb "Show", "/users/#{params[:id]}"
    respond_to do |format|
      format.html # show.html.erb
      format.js#on { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.js#on { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.js#on { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.js#on { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.js#on { head :no_content }
      else
        format.html { render action: "edit" }
        format.js#on { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.js#on { head :no_content }
    end
  end

  def upload

    myfile = params[:file_upload][:my_file].original_filename
    puts "@@@@@@@@@@@@"
    puts myfile
    tmp = params[:file_upload][:my_file].tempfile
    file = File.join("public", params[:file_upload][:my_file].original_filename)
    FileUtils.cp tmp.path, file

    #File.open("public/#{myfile}", "r") do |file|
     # puts file
    #end
   @file =  File.read("public/#{myfile}")
   File.delete file
  end
end
