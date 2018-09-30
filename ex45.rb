require 'pry'

class Player
  def initialize ()
    @hit_points = 10
    @alive = true
    @weapon = "fist"
    @max_damage = 1
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

    binding.pry
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

class Glade < Scene
  def enter()
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
