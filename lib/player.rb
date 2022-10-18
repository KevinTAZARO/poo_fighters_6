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
end



class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @name = name
        @life_points = 50
        @weapon_level = 1
    end

    def show_state
        puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weap = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weap}"
        if (new_weap > @weapon_level)
            puts "GG ! Tu as trouvé une arme plus puissante ! "
            @weapon_level = new_weap
        else
            puts "Pas de chance, better luck next time ! "
        end
    end

    def search_health_pack
        heal = rand(1..6)
        if (heal == 1)
            puts "Tu n'as rien trouvé..."
        elsif heal >= 2 && heal <= 5
            user.life_points=life_points+50
            puts "+50hp !"
        elsif heal==6
            user.life_points=life_points+80
            puts "+80hp !"
        end
    end


end