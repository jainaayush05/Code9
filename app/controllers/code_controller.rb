class CodeController < ApplicationController
require 'securerandom'
def index
	redirect_to "http://localhost:3000/#{SecureRandom.hex(2)}"
end
def show
	render('show')
end
def full
	render('full')
end
end
