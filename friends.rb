# 1. For a given person, return their favourite tv show
require("pry-byebug")

def tv_show_for_person(person)
   return person[:favourites][:tv_show]
end

# 2. For a given person, check if they like a particular food
def food_liked_by_person?(person, food)
  persons_foods = person[:favourites][:things_to_eat]
  return persons_foods.include?(food)
end

# 3. Allow a new friend to be added to a given person
def add_new_friend(person, friend)
  person[:friends].push(friend)
  return person
end

# 4. Allow a friend to be removed from a given person
def remove_friend(person, friend)
  person[:friends].delete(friend)
  return person
end

# 5. Find the total of everyone's money
def total_monies(people)
  total = 0
  for person in people
    monies = person[:monies]
    total += monies
  end
  return total
end

# 6. For two given people, allow the first person to loan a given value of money to the other

def loan_money(lender, borrower, amount)
  lender[:monies] -= amount
  borrower[:monies] += amount
  return {
    lender: lender,
    borrower: borrower
  }
end
# 7. Find the set of everyone's favourite food joined together

def get_favourite_foods(people)
  all_foods =[]
  for person in people
    all_foods += person[:favourites][:things_to_eat]
  end
  return all_foods
end

# 8. Find people with no friends
def find_loners(people)
  loners = []
  for person in people
    loners += [person] if person[:friends].empty?
  end
  return loners
end

# INSANE
# Find the people who have the same favourite tv show
def group_by_tv_show(people)
  tv_groupings = Hash.new()
  for person in people
    tv_show = person[:favourites][:tv_show]
    person_name = person[:name]
    if tv_groupings.has_key?(tv_show)
      tv_groupings[tv_show].push(person_name)
    else
      tv_groupings[tv_show] = [person_name]
    end
  end

  return tv_groupings.select { |tv_show, people_array|
    people_array.length > 1
  }
end
