def create_user params
  @user = User.new(params[:user])
  @user.save
end
