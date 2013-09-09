#!/usr/bin/env ruby

require 'dbus'
require 'sinatra'
require 'erb'

require './player'

# #####################################################################
# CONFIG
# #####################################################################
set :bind, '0.0.0.0'

# #####################################################################
# GLOBAL 
# #####################################################################
player = Player.new



get '/play' do
	player.play()
end

get '/pause' do
	player.pause()
end

get '/next' do
	player.next()
end

get '/previous' do
	player.previous()
end

get '/metadata' do
	player.metadata.acquire
end

get '/' do
	@buttons = [
		{name: 'Previous', 	icon: 'step-backward'},
		{name: 'Play', 		icon: 'play'},
		{name: 'Pause', 	icon: 'pause'},
		{name: 'Next', 		icon: 'step-forward'}
	]
	@metadata = player.metadata

	erb :index
end
