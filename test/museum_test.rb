require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/exhibit"
require "./lib/patron"
require "./lib/museum"

class MuseumTest < Minitest::Test

  def setup
    #Museum
    @dmns = Museum.new("Denver Museum of Nature and Science")

    #Exhibits
    @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    @imax = Exhibit.new({name: "IMAX",cost: 15})

    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    #Patron_1
    @patron_1 = Patron.new("Bob", 20)
    @patron_1.add_interest("Dead Sea Scrolls")
    @patron_1.add_interest("Gems and Minerals")

    #Patron_2
    @patron_2 = Patron.new("Sally", 20)
    @patron_2.add_interest("IMAX")
  end

  def test_it_exists
    assert_instance_of Museum, @dmns
  end

  def test_it_has_attributes
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_equal "Denver Museum of Nature and Science", dmns.name
    assert_equal [], dmns.exhibits
    assert_equal [], dmns.patrons
  end

  def test_it_can_add_exhibits


    assert_equal [@gems_and_minerals, @dead_sea_scrolls, @imax], @dmns.exhibits
  end

  def test_it_can_recommend_appropriate_exhibits_to_patrons_based_on_interests_of_patron
    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], @patron_1.interests
    assert_equal @patron_1.interests, @dmns.recommend_exhibits(@patron_1)

  end

  def test_it_can_admit_patrons
    dmns = Museum.new("Denver Museum of Nature and Science")

    patron_1 = Patron.new("Bob", 20)
    patron_1.add_interest("Gems and Minerals")
    patron_1.add_interest("Dead Sea Scrolls")

    patron_2 = Patron.new("Sally", 20)
    patron_2.add_interest("Dead Sea Scrolls")

    patron_3 = Patron.new("Johnny", 5)
    patron_3.add_interest("Dead Sea Scrolls")

    dmns.admit(patron_1)
    dmns.admit(patron_2)
    dmns.admit(patron_3)

    assert_equal [patron_1, patron_2, patron_3], dmns.patrons
  end

  def test_it_can_organize_patrons_by_exhibit_interest
      dmns = Museum.new("Denver Museum of Nature and Science")

      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})

      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)


      patron_1 = Patron.new("Bob", 20)
      patron_1.add_interest("Gems and Minerals")
      patron_1.add_interest("Dead Sea Scrolls")

      patron_2 = Patron.new("Sally", 20)
      patron_2.add_interest("Dead Sea Scrolls")

      patron_3 = Patron.new("Johnny", 5)
      patron_3.add_interest("Dead Sea Scrolls")

      dmns.admit(patron_1)
      dmns.admit(patron_2)
      dmns.admit(patron_3)


      result = {gems_and_minerals => [patron_1], dead_sea_scrolls => [patron_1, patron_2, patron_3], imax => []}


    assert_equal result, dmns.patrons_by_exhibit_interest

  end

end
