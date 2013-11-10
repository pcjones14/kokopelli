module ApplicationHelper

	def authenticate
	  if !session[:login]
	    redirect_to :root
	    flash[:error] = "You are not authorized to view that area"
	    return false
	  end
	  return true
	end

	def parse_keywords(string)
		if string.index('_') != nil
			split_string_array = string.split('_')
			output_string = ""
			split_string_array.each do |split_string|
				split_string.capitalize!
				output_string = output_string + split_string + " "
			end
			return output_string[0..-2]
		end
		return string.capitalize!
	end

end