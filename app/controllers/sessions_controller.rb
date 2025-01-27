class SessionsController < ApplicationController
	def login;end

	def create
		flash.alert = "logged in"
	end
end
