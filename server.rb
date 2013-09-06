#!/usr/bin/env ruby

require 'dbus'
require 'sinatra'
require 'erb'

bus = DBus::SessionBus.instance
# get a rb object
proxy = bus.introspect("org.mpris.MediaPlayer2.rhythmbox", "/org/mpris/MediaPlayer2")
proxyi = proxy["org.mpris.MediaPlayer2.Player"]

set :bind, '0.0.0.0'

get '/play' do
	proxyi.Play()
end

get '/pause' do
	proxyi.Pause()
end

get '/next' do
	proxyi.Next()
end

get '/previous' do
	proxyi.Previous()
end

get '/' do
	@buttons = [
		{name: 'Previous', 	icon: 'step-backward'},
		{name: 'Play', 		icon: 'play'},
		{name: 'Pause', 	icon: 'pause'},
		{name: 'Next', 		icon: 'step-forward'}
	]

	erb :index
end
