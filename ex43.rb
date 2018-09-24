class Scene
  def enter()
    puts "Write a scene here."

  end
end


class Engine

  def initialize(scene_map)
    @scene_map = scene_map
    @dead = false
    @landed = false
  end

  def play()
    current_room =

    while !@dead && !@landed
      puts "write the game"
      exit(0)
    end
  end
end

class Death < Scene

  def enter(cause)
    if cause == "attacked"
      puts "You've been gutted by a boarder.  It wasn't pretty."
    end
    dead = true
  end
end

class CentralCorridor < Scene

  def enter()
  end
end

class LaserWeaponArmory < Scene

  def enter()
    attack_roll = rand(1..20)
    if attack_roll == 1

    end

  end
end

class TheBridge < Scene

  def enter()
  end
end

class EscapePod < Scene

  def enter()
    landed = true
  end
end


class Map

  def initialize( start_scene)
  end

  def next_scene( scene_name)
  end

  def opening_scene()
  end
end


a_map = Map.new('central_corridor')
a_game = Engine.new(a_map)
a_game.play()
