# require 'pry'

class Character
  def initialize ()
    @hit_points = 10
    @weapon = "fist"
    @max_damage = 4
  end

  attr_accessor :weapon, :max_damage

  def is_alive()
    if hit_points < 1
      return false
    else
      return true
    end
  end

  def equip(weapon, damage)
    @weapon = weapon
    @max_damage = damage
    puts "Equipped #{weapon}"
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
  end

  def play(player1)
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('finished')
    player = player1

    while current_scene != last_scene
      next_scene_name = current_scene.enter(player)
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    current_scene.enter(player)
  end
end

class Death < Scene

  def enter(player)
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
  def enter(player)
    @player = player
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
      glade_choice = $stdin.gets.chomp.downcase

      if glade_choice == "west"
        puts "You brush some branches aside and head away from the clearing."
        return 'river'
      elsif glade_choice == "south"
        puts "The trees thin as you leave the forest."
        return 'meadow'
      elsif glade_choice == "sword"
        luck_roll = rand(1..20)
        if luck_roll == 20
          puts "You brace both feet and lift with all your might."
          puts "You may not be the chosen one, but you've managed to lift the sword, stone and all."
          puts "You're pretty sure you could do some decent damage with this."
          player.equip("Sword in the Stone", 12)
          sword_in_stone = false
        elsif luck_roll > 1
          puts "You brace both feet and lift with all your might."
          puts "You are the king / queen / on-binary regent of Albion!"
          puts "Also, you have a sword with which you can defend yourself."
          player.equip("Magic Sword", 10)
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
  def enter(player)
    @player = player
    puts "Hey, look, a River"
    puts "WATERFALL or POOL"
    print "> "
    river_choice = $stdin.gets.chomp.downcase

    if river_choice == "waterfall"
      puts "You brush some branches aside and head away from the clearing."
      return 'waterfall'
    elsif river_choice == "pool"
      puts "The trees thin as you leave the forest."
      return 'pool'
    end
  end
end

class Waterfall < Scene
  def enter(player)
    @player = player
    puts "Hey, look, a waterfall"
    puts "CAVE or RIVER"
    print "> "
    waterfall_choice = $stdin.gets.chomp.downcase

    if waterfall_choice == "cave"
      puts "You go to the cave"
      return 'death'
    elsif waterfall_choice == "river"
      puts "You go to the river."
      return 'river'
    end
  end
end

class Pool < Scene
  def enter(player)
    @player = player
    puts "Hey, look, a forest pool"
    puts "RUN or OTHER"
    print "> "
    pool_choice = $stdin.gets.chomp.downcase

    if pool_choice == "run"
      puts "You go to the river"
      return 'river'
    else
      puts "You go to the death."
      return 'death'
    end
  end
end

class Meadow < Scene
  def enter(player)
    @player = player
    puts "Hey, look, a meadow, and sheep"
    puts "SHEEP or COTTAGE"
    print "> "
    meadow_choice = $stdin.gets.chomp.downcase

    if meadow_choice == "sheep"
      puts "You go to the fight a wolf"
      return 'death'
    elsif meadow_choice == "cottage"
      puts "You go to the cottage."
      return 'cottage'
    end
  end
end

class Cottage < Scene
  def enter(player)
    @player = player
    puts "Hey, look, a dinner table"
    puts "FATHER or DAUGHTER"
    print "> "
    cottage_choice = $stdin.gets.chomp.downcase

    if cottage_choice == "father"
      puts "You go to the father"
      puts "He eats you"
      return 'death'
    elsif cottage_choice == "daughter"
      puts "You go to the daughter."
      puts "She eats you"
      return 'death'
    end
  end
end

class Finished < Scene
  def enter(player)
    @player = player
    puts "You won! Good job."
  end
end

class Map
  @@scenes = {
      'glade' => Glade.new(),
      'river' => River.new(),
      'waterfall' => Waterfall.new(),
      'pool' => Pool.new(),
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

player = Character.new()
a_map = Map.new('glade')
a_game = Engine.new(a_map)
a_game.play(player)
