require 'pry'

class Player
  def initialize ()
    @hit_points = 10
    @alive = true
    @weapon = "fist"
    @max_damage = 4
  end

  def life_check()
    if hit_points < 1
      return false
    else
      return true
    end
  end
end

class Scene
  def enter()
    puts "Write a scene here."
  end
end

class Engine

  def initialize (scene_map)
    @scene_map = scene_map
    @player = Player.new()
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
      "At least no one got it on camera.  Probably",
      "Who saw that coming?"
    ]
    puts "#{deaths[rand(0..deaths.length)]}"
    exit(0)
  end
end

class Glade < Scene
  def enter()
    sword_in_stone = true
    still_here = true

    while still_here
      puts "You awaken in a sunny glade.  You can hear birdsong nearby."
      puts "To the WEST, deeper in the forest, you can hear a brook babbling."
      puts "To the SOUTH, you think you can hear some sheep."
      if sword_in_stone
        puts "Oh, and nearby there is a magical SWORD sticking out of a stone."
      else
        puts "Oh, and over there is where you found the sword in the stone."
      end
      puts "What do you do?"
      print "> "
      the_first_choice = $stdin.gets.chomp.downcase

      if the_first_choice == "west"
        puts "You brush some branches aside and head away from the clearing."
        return 'river'
      elsif the_first_choice == "south"
        puts "The trees thin as you leave the forest."
        return 'meadow'
      elsif the_first_choice == "sword"
        luck_roll = rand(1..20)
        if luck_roll == 20
          puts "You brace both feet and lift with all your might."
          puts "You may not be the chosen one, but you've managed to lift the sword, stone and all."
          puts "You're pretty sure you could do some decent damage with this."
          @@player.weapon = "Sword in the Stone"
          @@player.max_damage = 12
          sword_in_stone = false
        elsif luck_roll > 1
          puts "You brace both feet and lift with all your might."
          puts "You are the king / queen / on-binary regent of Albion!"
          puts "Also, you have a sword with which you can defend yourself."
          binding.pry
          @player.weapon = "Magic Sword"
          @player.max_damage = 10
          sword_in_stone = false
        else
          puts "You wish for a bottle of ibuprofen."
          puts "That rock is firmly rooted and the sword is stuck."
          return 'glade'
        end
      else
        puts "Look mate.  I'm a simple computer program."
        puts "I can only understand so many commands."
        puts "Try something like 'West' or 'South' or something in all caps up there."
        return 'central_corridor'
      end
    end
  end
end

class River < Scene
  def enter()
  end
end

class Waterfall < Scene
  def enter()
  end
end

class Meadow < Scene
  def enter()
  end
end

class Cottage < Scene
  def enter()
  end
end

class Finished < Scene
  def enter()
    puts "You won! Good job."
  end
end

class Map
  @@scenes = {
      'glade' => Glade.new(),
      'river' => River.new(),
      'waterfall' => Waterfall.new(),
      'meadow' => Meadow.new(),
      'cottage' => Cottage.new(),
      'death' => Death.new(),
      'finished' => Finished.new()
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

a_map = Map.new('glade')
a_game = Engine.new(a_map)
a_game.play()
