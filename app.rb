require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

myu = Player.new("Myu") #josé
ren = Player.new("Ren") #josette

binding.pry