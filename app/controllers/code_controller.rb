class CodeController < ApplicationController
require 'securerandom'
def index
	@rand_str=SecureRandom.hex(2);
	redirect_to "http://localhost:3000/#{@rand_str}"
end
def show
	@cookies =[cookies[:r1],cookies[:r2],cookies[:r3],cookies[:r4],cookies[:r5]]
	hash = Hash[@cookies.map.with_index.to_a]
	hash["#{params[:id]}"]
	if !@cookies.include? ("#{params[:id]}")
	cookies[:r5]=cookies[:r4]
	cookies[:r4]=cookies[:r3]
	cookies[:r3]=cookies[:r2]
	cookies[:r2]=cookies[:r1]
	cookies[:r1]={ :value => "#{params[:id]}"}
	end
	render('show')
end
def full
	render('full')
end
end
