require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*="
puts "|         Welcome to the 'POO GAME'!             |" 
puts "| Le but du jeu est d'être le dernier survivant !|"
puts "*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*="


puts "USER NAME ?"
print ">"
name=gets.chomp
user=HumanPlayer.new(name)
puts "Welcome #{name} ! "
player1 = Player.new("Eric") #notre 1er joueur
player2 = Player.new("Benji") #notre 2eme joueur

puts

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)

    user.show_state
    sleep(1)
    puts
    puts "Quelle action veut tu effectuer ?"
    puts
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts
    puts "Attaquer un joueur en vue :"
    puts "0 - #{player1.show_state}"
    puts "1 - #{player2.show_state}"
    puts
    sleep(1)
    print ">"
    choix = gets.chomp
    puts

   if choix == "a"
      user.search_weapon
   elsif choix == "s"
      user.search_health_pack
   elsif choix == "0"
      user.attacks(player1)
   elsif choix == "1"
      user.attacks(player2)
   end
   puts
   puts "Les autres joueurs t'attaquent !!"
   sleep(1)

   if player1.life_points <= 0
    puts "#{player1} est mort."
    next
    else
    player1.attacks(user)
    sleep 2.5
    if user.life_points <= 0
        break
    end
    end

    if player2.life_points <= 0
    puts "#{player2} est mort."
    next
    else
    player2.attacks(user)
    sleep 2.5
    if user.life_points <= 0
        break
    end
    end

    break if player1.life_points <= 0 && player2.life_points <= 0
end


puts "Game Over !"
    if user.life_points > 1
         puts "GG, get a life now."
    else puts "Try again bruh..."
    end


#binding.pry