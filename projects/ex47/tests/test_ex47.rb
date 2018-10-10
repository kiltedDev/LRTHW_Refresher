require "./lib/ex47.rb"
require "test/unit"

class TestEx47 < Test::Unit::TestCase

  def test_room()
    gold = Room.new("GoldRoom", """This room has gold in it you can grab.  There's a door to the north.""")
    assert_equal("GoldRoom", gold.name)
    assert_equal({}, gold.paths)
  end

  def test_room_paths()
    center = Room.new("Center", "Test room in the center.")
    north = Room.new("North", "Test room in the north.")
    south = Room.new("South", "Test room in the south.")

    center.add_paths({'north' => north, 'south' => south})

    assert_equal(north, center.go('north'))
    assert_equal(south, center.go('south'))
  end

  def test_map()
    start = Room.new("Start", "The room you start in")
    west = Room.new("Trees", "There are trees here")
    down = Room.new("Dungeon", "It's dark down here")

    start.add_paths({'west' => west, 'down' => down})
    west.add_paths({'east' => start})
    down.add_paths({'up' => start})

    assert_equal(west, start.go('west'))
    assert_equal(start, start.go('west').go('east'))
    assert_equal(start, start.go('down').go('up'))

  end

end
