require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

myu = Player.new("Myu") #josé
ren = Player.new("Ren") #josette

while myu.life_points > 0 && ren.life_points > 0
    puts "Here is the state of each fighters : \n#{myu.show_state} \n#{ren.show_state}"
    sleep 2
    puts "Get ready for the next battle"
       ren.attacks(myu)
       if myu.life_points <= 0
           sleep 2
           puts "#{myu.name} is dead"
           break
       else
           sleep 2
           puts "Warning ! #{myu.name} is counter-attacking !"
           myu.attacks(ren)
           if ren.life_points <= 0
               sleep 2
               puts "#{ren.name} is dead"
               break
           end
       end
end

#binding.pry