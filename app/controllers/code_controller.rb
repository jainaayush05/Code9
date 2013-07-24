class CodeController < ApplicationController
require 'securerandom'
def index
	@rand_str=SecureRandom.hex(2);
	redirect_to "http://localhost:3000/#{@rand_str}"
end
def show
	@cookies =[cookies[:r1],cookies[:r2],cookies[:r3],cookies[:r4],cookies[:r5],cookies[:r6],cookies[:r7],cookies[:r8],cookies[:r9],cookies[:r10]]
	hash = Hash[@cookies.map.with_index.to_a]
	hash["#{params[:id]}"]
	@flag=false
	@cookies.each do |c|
		if c.split("!!!!")[0].eql? params[:id]
			@flag=true
			break
		end
	end
	if !@flag
	cookies[:r10]=cookies[:r9]
	cookies[:r9]=cookies[:r8]
	cookies[:r8]=cookies[:r7]
	cookies[:r7]=cookies[:r6]
	cookies[:r6]=cookies[:r5]
	cookies[:r5]=cookies[:r4]
	cookies[:r4]=cookies[:r3]
	cookies[:r3]=cookies[:r2]
	cookies[:r2]=cookies[:r1]
	cookies[:r1]={ :value => "#{params[:id]}!!!!#{Time.now.strftime("%A  %-d/%-m/%y  %H:%M ")}!!!!Aayush"}
	end
	render('show')
end
def full
	render('full')
end
end
