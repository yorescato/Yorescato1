class LeadsController < ApplicationController
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	def create 					
		@lead = Lead.new lead_params
		respond_to do |format|
			if Lead.find_by_email(@lead.email).blank?			
				if @result = @lead.save
					format.html { redirect_to root_path }
					format.js
				else
					format.html { redirect_to root_path, @lead.errors } 
					format.js
				end			
			else 
				format.html { redirect_to root_path, @lead.errors  }
				format.js
			end
		end
	end 

	private 

	def lead_params
		params.require(:lead).permit(:email, :device, :country)
	end
end