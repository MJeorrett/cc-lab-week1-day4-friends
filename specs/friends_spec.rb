require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../friends' )

class TestFriends < MiniTest::Test

  def setup

    @person1 = {
      name: "Rick",
      age: 12,
      monies: 1,
      friends: ["Jay","Keith","Marc", "Val"],
      favourites: {
        tv_show: "Friends",
        things_to_eat: ["charcuterie"]
      }
    }

    @person2 = {
      name: "Jay",
      age: 15,
      monies: 2,
      friends: ["Keith"],
      favourites: {
        tv_show: "Scrubs",
        things_to_eat: ["soup","bread"]
      }
    }

    @person3 = {
      name: "Val",
      age: 18,
      monies: 20,
      friends: ["Rick", "Jay"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["ratatouille", "stew"]
      }
    }

    @person4 = {
      name: "Keith",
      age: 18,
      monies: 20,
      friends: ["Rick", "Jay", "Marc"],
      favourites: {
        tv_show: "Pokemon",
        things_to_eat: ["spaghetti"]
      }
    }

    @person5 = {
      name: "Marc",
      age: 20,
      monies: 100,
      friends: [],
      favourites: {
        tv_show: "Scrubs",
        things_to_eat: ["spinach"]
      }
    }

    @people = [@person1, @person2, @person3, @person4, @person5]

  end

  def test_name
    assert_equal("Marc",@person5[:name])
  end

  # 1. For a given person, return their favourite tv show
  def test_tv_show_for_person
    expected = "Friends"
    actual = tv_show_for_person(@person1)
    assert_equal(expected, actual)
  end

  # 2. For a given person, check if they like a particular food
  def test_food_liked_by_person?
    expected1 = true
    person1 = @person2
    food1 = "soup"
    actual1 = food_liked_by_person?(person1,food1)
    expected2 = false
    person2 = @person2
    food2 = "grapes"
    actual2 = food_liked_by_person?(person2,food2)
    assert_equal(expected1, actual1)
    assert_equal(expected2, actual2)
  end

  # 3. Allow a new friend to be added to a given person
  def test_add_new_friend()
    expected = {
      name: "Rick",
      age: 12,
      monies: 1,
      friends: ["Jay","Keith","Marc", "Val", "Bob"],
      favourites: {
        tv_show: "Friends",
        things_to_eat: ["charcuterie"]
      }
    }
    actual = add_new_friend(@person1, "Bob")
    assert_equal(expected, actual)
  end

  # 4. Allow a friend to be removed from a given person
def test_remove_friend()
  expected = {
    name: "Jay",
    age: 15,
    monies: 2,
    friends: [],
    favourites: {
      tv_show: "Scrubs",
      things_to_eat: ["soup","bread"]
    }
  }
  actual = remove_friend(@person2, "Keith")
  assert_equal(expected, actual)
end

  # 5. Find the total of everyone's money
  def test_total_monies()
    expected = 143
    actual = total_monies(@people)
    assert_equal(expected, actual)
  end

  # 6. For two given people, allow the first person to loan a given value of money to the other
  def test_loan_money()
    expected ={
      lender: {
        name: "Marc",
        age: 20,
        monies: 50,
        friends: [],
        favourites: {
          tv_show: "Scrubs",
          things_to_eat: ["spinach"]
        }
      },
      borrower: {
        name: "Keith",
        age: 18,
        monies: 70,
        friends: ["Rick", "Jay", "Marc"],
        favourites: {
          tv_show: "Pokemon",
          things_to_eat: ["spaghetti"]
        }
      }
    }
    actual = loan_money(@person5,@person4,50)
    assert_equal(expected, actual)
  end


  # 7. Find the set of everyone's favourite food joined together
  def test_get_favourite_foods()
    expected = ["charcuterie", "soup", "bread", "ratatouille", "stew", "spaghetti", "spinach"]
    actual = get_favourite_foods(@people)
    assert_equal(expected, actual)
  end


  # 8. Find people with no friends
  def test_find_loners()
    expected = [@person5]
    actual = find_loners(@people)
    assert_equal(expected, actual)
  end


  # INSANE
  # Find the people who have the same favourite tv show
  def test_group_by_tv_show()
    expected = {
      "Friends" => [
        "Rick"
      ],
      "Scrubs" => [
        "Jay",
        "Marc"
      ],
      "Pokemon" => [
        "Val",
        "Keith"
      ]
    }
    actual = group_by_tv_show(@people)
    assert_equal(expected, actual)
  end

end
