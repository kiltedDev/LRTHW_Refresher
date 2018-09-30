class Scene
  def enter()
    puts "Write a scene here."
  end
end

class Engine

  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('finished')

    while current_scene != last_scene
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    current_scene.enter()
  end
end

class Death < Scene

  def enter
    deaths = [
      "Well, that was embarassing",
      "But you meant to do that right?",
      "Your mother would be proud.",
      "At least no one got it on camera.  Probably"
    ]
    puts "#{deaths[rand(0..deaths.length)]}"
    exit(0)
  end
end

class CentralCorridor < Scene

  def enter()
    puts "Your ship has been invaded by Gothons."
    puts "At least, you're reasonably sure they're Gothons."
    puts "You skipped that class at the Academy."
    puts "But someone has boarded, and you're getting off this ride."
    puts "\n"
    puts "Here's your plan:"
    puts "Get the El Supremo bmb from the Armory"
    puts "put it in the bridge and arm it"
    puts "blow the ship to smithereens"
    puts "AFTER escaping in the escape pod."
    puts "\n"
    puts "Currently, you're in the Central Corridor"
    puts "Well, running.  You're running down the central corridor."
    puts "You just lost a gun fight with the boarders."
    puts "One of them climbs out the hatch to the Armory."
    puts "What do you do?"
    print "> "

    stuff_you_do = $stdin.gets.chomp.downcase

    if stuff_you_do == "shoot!"
      puts "You shoot first!"
      puts "Lucky thing too.  That googly eyed Gothon(?) had a mighty big shooter."
      return 'laser_weapon_armory'
    elsif stuff_you_do == "dodge!"
      puts "That's ridiculous.  No one can dodge a laser."
      puts "What were you expecting, a wrench?"
      puts "Your corpse falls to the floor and "
      puts "The Gothons have a lovely new ship."
      puts "Good job poindexter."
      return 'death'
    else
      puts "Look mate.  I'm a simple computer program."
      puts "I can only understand so many commands."
      puts "Try something like 'Shoot!' or 'Dodge!'"
      return 'central_corridor'
    end
  end
end

class LaserWeaponArmory < Scene

  def enter()
    puts "Like a shadow in the night you sneak into the Armory."
    puts "There's a Gothon, probably, with their back to you."
    puts "You deftly sneak past him to the Neutron Bomb Locker."
    puts "The locker has a keypad, waiting to accept 3 digits from you."
    code = [rand(1..9),rand(1..9),rand(1..9)]
    master_code = [5,5,5]
    entry = []
    tries = 0
    while (entry != code && entry != master_code) && tries < 4
      entry = []
      3.times do |n|
        puts "[enter digit]"
        entry.push($stdin.gets.to_i)
        if entry[n] == code[n]
          puts "✓"
        else
          puts "X"
        end

      end
      if entry == code || entry == master_code
        puts "A green light flashes"
      else
        puts "A red light flashes"
        tries += 1
      end
    end

    if entry == code || entry == master_code
      puts "With sweat on your brow (your species sweats, right?),"
      puts "you open the locker and remove the Neutron Bomb.  It's smaller than you expected."
      puts "You pocket the bomb and run for the bridge."
      return 'the_bridge'
    else
      puts "An alarm sounds as you enter the incorrect code for the third time."
      puts "The array or ordinance all lights up with pretty red lights."
      puts "You can only appreciate this for a few seconds before you and the ship"
      puts "are blown to smithereens."
      return 'death'
    end
  end
end

class TheBridge < Scene

  def enter()
    puts "You run onto the Bridge with the compact neutron bomb"
    puts "weighing down your trousers.  You can see that the bridge"
    puts "is heavily occupied by boarders.  They appear to be arguing"
    puts "If your translator is correct, they're arguing about what"
    puts "to get for lunch after they're done here."
    print "> "

    bridgey_action = $stdin.gets.chomp.downcase

    if bridgey_action == "sneak!"
      puts "You silently set the bomb under a console and arm the thing."
      puts "You planned to give yourself 10 minutes to get to an"
      puts "escape pod.  Unfortunately, it autocorrected to 60 seconds."
      puts "Stupid Autocorrect.  You bolt down the hallway towards the escape pod."
      return 'escape_pod'
    elsif bridgey_action == "shoot 'em all!"
      puts "You unleash a torrent of hot plasma."
      puts "Seven of what you're still guessing are Gothons die fiery deaths"
      puts "Their companions have no trouble perforating you with outdated weaponry, though."
      puts "The Gothons have a lovely new ship."
      puts "Good shooting Ace."
      return 'death'
    else
      puts "Look bub.  Like I told the other guy..."
      puts "I'm a simple computer program."
      puts "I can only understand so many commands."
      puts "Try something like 'Sneak!' or 'Shoot 'em All!'"
      return 'the_bridge'
    end
  end
end

class EscapePod < Scene

  def enter()
    puts "You start strapping yourself in while catching your breath."
    puts "Your shins hurt. You never really sorted out the doors"
    puts "on the ship having such high bottoms."
    puts "As you leave the ship and descend to the nearby planet,"
    puts "the computer's voice 'Landing on Planet Percal 25' in 9 minutes."
    puts "Well, at least you aren't on the ship any longer."
    return 'finished'
  end
end

class Finished < Scene
  def enter()
    puts "You won! Good job."
  end
end

class Map
  @@scenes = {
      'central_corridor' => CentralCorridor.new(),
      'laser_weapon_armory' => LaserWeaponArmory.new(),
      'the_bridge' => TheBridge.new(),
      'escape_pod' => EscapePod.new(),
      'death' => Death.new(),
      'finished' => Finished.new(),
    }

  def initialize( start_scene)
    @start_scene = start_scene

  end

  def next_scene( scene_name)
    val = @@scenes[scene_name]
    return val
  end

  def opening_scene()
    return next_scene(@start_scene)
  end
end


a_map = Map.new('central_corridor')
a_game = Engine.new(a_map)
a_game.play()
