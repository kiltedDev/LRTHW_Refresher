require "./lib/parser.rb"
require "test/unit"

class TestParser < Test::Unit::TestCase

  @@x = parse_sentence([['verb', 'run'], ['direction', 'north']])
  @@y = parse_sentence([['noun', 'bear'], ['verb', 'eat'], ['stop', 'the'], ['noun', 'honey']])
  @@z = parse_sentence([['verb', 'slay'], ['stop', 'the'], ['noun', 'dragon']])

  def test_player_fill
    assert_equal(@@x.subject, 'player')
  end

  def test_subject
    assert_equal(@@y.subject, 'bear')
  end

  def test_verb
    assert_equal(@@x.verb, 'run')
    assert_equal(@@y.verb, 'eat')
    assert_equal(@@z.verb, 'slay')
  end

  def test_object
    assert_equal(@@x.object, 'north')

    assert_equal(@@y.object, 'honey')
    assert_equal(@@z.object, 'dragon')
  end

end
