module ApplicationHelper

def authenticate
  if !session[:login]
    redirect_to :root
    flash[:error] = "You are not authorized to view that area"
    return false
  end
  return true
end

end
