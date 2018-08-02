# Big O-ctopus and Biggest Fish
# A Very Hungry Octopus wants to eat the longest fish in an array of fish.
#
fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"
# Sluggish Octopus
def sluggish_octopus(fish)
  longest_fish = fish[0]
  fish.each.with_index do |fish1, i1|
    fish.each.with_index do |fish2, i2|
      next if fish1.length < fish2.length
      longest_fish = fish1 if fish1.length > longest_fish.length
    end
  end
  longest_fish
end

# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths
#
# Dominant Octopus
def dominant_octopus(fish)
  return fish if fish.length <= 1

  partition = fish.length / 2
  left_side = dominant_octopus(fish.take(partition))
  right_side = dominant_octopus(fish.drop(partition))

  merge(left_side,right_side)
end

def merge(arr1,arr2)
  output = []
  until arr1.empty? || arr2.empty?
    arr1.first.length >= arr2.first.length ? output << arr1.shift : output << arr2.shift
  end
  output += arr1 + arr2
  output
end

def n_log_n_sort(fish)
  dominant_octopus(fish)[0]
end

# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Demo. Remember that Big O is classified by the dominant term.
#
# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.

def clever_octopus(fish)
  longest_fish = fish[0]
  fish.each { |fishy| longest_fish = fishy if fishy.length > longest_fish.length }
  longest_fish
end
#
# Dancing Octopus
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles in the following directions:
#
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding tentacle. We can assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.
#
# Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.
def slow_dance(direction, tiles_array)
  i = 0
  loop do
    return i if direction == tiles_array[i]
    i += 1
  end
end

#
# slow_dance("up", tiles_array)
# > 0
#
# slow_dance("right-down", tiles_array)
# > 3
# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.
tiles_hash = { "up" => 0,
 "right-up" => 1,
 "right" => 2,
 "right-down" => 3,
 "down" => 4,
 "left-down" => 5,
 "left" => 6,
 "left-up" => 7
}

def fast_dance(direction,hash)
  hash[direction]
end

#
# fast_dance("up", new_tiles_data_structure)
# > 0
#
# fast_dance("right-down", new_tiles_data_structure)
# > 3
