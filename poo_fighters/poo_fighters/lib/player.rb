class Player
attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10 #définit les lp des players à 10.
    end

    def show_state
        puts "#{@name} have #{@life_points} lp left"
    end

    def gets_damage(damage)
        @life_points -= damage
        if @life_points <= 0
            "#{name} is dead"
        else
            "#{name} have #{@life_points} lp left"
        end
    end

    def compute_damage
        dmg = rand(0..10)
        if dmg == 0
            puts "Noob ! He just missed !"
        elsif dmg >=9
            puts "Fatality !"
        end
        return dmg
    end

    def attacks(player)
        puts "#{@name} attacks #{player.name}"
        lp_lost=compute_damage 
        puts ":it inflicts #{lp_lost} points of damage"
        player.gets_damage(lp_lost)

        puts"*********************************"
    end

    def fight(p1, p2)
        while p1.life_points > 0 && p2.life_points > 0
             puts "Here is the state of each fighters : \n#{p1.show_state} \n#{p2.show_state}"
             sleep 2
             puts "Get ready for the next battle"
                p2.attacks(p1)
                if p1.life_points <= 0
                    sleep 2
                    puts "#{p1.name} is dead"
                    break
                else
                    sleep 2
                    puts "Warning ! #{p1.name} is counter-attacking !"
                    p1.attacks(p2)
                    if p2.life_points <= 0
                        sleep 2
                        puts "#{p2.name} is dead"
                        break
                    end
                end
        end
    end
end

