require 'json'

class TodosController < ApplicationController
	def index
		# Hard code some cookes for testing purposes
		session[:todos] = [{:id => 1,:text => "Test ToDO 1",:completion_date => "5-30-2015"},{:id => 2,:text => "Test ToDO 2",:completion_date => "5-29-2015"}].to_json
		@todos = JSON.parse session[:todos] 
	end
end
