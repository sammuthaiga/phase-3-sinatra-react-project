class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here

  # Get all plumbers(array formart)
  get "/plumbers" do
     plumbers = Plumber.all 
     p plumbers
     plumbers.to_json()
  end

  # Get a single plumber
  get "/plumber/:id" do
    plumber = Plumber.find_by(id: params[:id])
    plumber.to_json()
  end

  # Post a plumber.

  post "/plumber/" do
    plumber = Plumber.create(
      name: params[:name],
      image_url: params[:image_url],
      task: params[:task],
      description: params[:description],
      phone_number: params[:phone_number],
      location: params[:location],
      star_rating: params[:star_rating],
      comment: params[:comment],
      datetime: params[:datetime]
  ) 
  plumber.save()

  {
    "Message": "Plumber created successfully",
    "Status": "HTTP_200_OK"
  }.to_json()
  end

  # Patch a plumber(update).
  patch "/plumber/update/:id" do 
    plumber = Plumber.find_by(id: params[:id])
    
    plumber.update(
      name: params[:name],
      image_url: params[:image_url],
      task: params[:task],
      description: params[:description],
      phone_number: params[:phone_number],
      location: params[:location],
      star_rating: params[:star_rating],
      comment: params[:comment],
      datetime: params[:datetime]
    )
    plumber.to_json() 
  end

  #Delete a plumber
  delete "/plumber/:id" do
    plumber = Plumber.find_by(id: params[:id])
    plumber.destroy
    {
      "message":"Plumber #{:id}, was Deleted!",
      "Status":"HTTP_Status_OK"
  }.to_json()
  end

  # Get all Users.
  get "/user" do
    users = User.all 
    p users
    users.to_json()
 end
  #  Get a user by id.
   get "/user/:id" do
    user = User.find_by(id: params[:id])
    user.to_json()
  end


  # Save a user.
  post "/user/" do
    user_existing = User.find_by(email: params[:email])
    # check if user already exists
    if user_existing
      return {"error":"User Already Exists"}.to_json()
    end
    # Create a new user
    user = User.create(
      Fullname: params[:Fullname],
      image_url: params[:image_url],
      email: params[:email],
      phone_number: params[:phone_number],  
      task: params[:task],
      description: params[:description],
      star_rating: params[:star_rating],  
      comment: params[:comment],
      feedback: params[:feedback]
    )
    user.save
    {
      "message":"User Created Successfully",
      "status": "HTTP_201_created",

  }.to_json()
  
  end
  # Patch User
  patch "/user/update/:id" do 
    user = User.find_by(id: params[:id])

    user.update(
      Fullname: params[:Fullname],
      image_url: params[:image_url],
      email: params[:email],
      phone_number: params[:phone_number],  
      task: params[:task],
      description: params[:description],
      star_rating: params[:star_rating],  
      comment: params[:comment],
      feedback: params[:feedback]
    )
    user.to_json()
  end

  # Delete a user.
  delete "/user/:id" do
    user = User.find_by(id: params[:id])
    user.destroy
    {
      "message":"User #{:id}, was Deleted!",
      "Status":"HTTP_Status_OK"
  }.to_json()
  end

  # Request a service.
  post "/request/service/" do 
    # get plumber id from React
    plumber = Plumber.find_by(id: params[:plumber_id])
    # get user email from React to get user id.
    user_existing = User.find_by(email: params[:email])

    # create a service instance
    if user_existing
      service = Service.create(
        user_id: user_existing.id,
        plumber_id: params[:plumber_id]
      )
      service.save
      {
        "message":"Service created successfully",
        "status":"201_Service_Created"
    }.to_json()
  else
    {
      "error":"User not found",
      "status":"404_not_found"
    }.to_json()
    end


  end
  # get all services.
  get "/services" do 
   services = Service.all 
    p services
    services.to_json()
  end


  # Get all plumber users
  get '/plumber/:id/users' do
    # get the plumber
    plumber = Plumber.find_by(id: params[:id])
    plumber.services.find_all do |service|
      service.user_id
    end.to_json(only: [:id], include: {user: {only: [:id, :fullname, :email, :phonenumber, :language, :roles]}})
  end



end
