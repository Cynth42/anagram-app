class Word < ActiveRecord::Base
 
  def self.find_anagrams(string)
    # Convert word to an array of letters
    letters = string.split(//)
 
    # Create an array to store our combinations
    combinations = []
    
    # Loop through each letter in letters
    letters.each do |letter|
      # Select the remaining letters
      remaining = letters.select { |l| l != letter }
 
      # Create a new word by combining the letter + the remaining letters
      # Add new word to anagrams array
      combinations << letter + remaining.join('')
 
      # Create a new word by combining the letter + the reverse of the remaining letters
      # Add new word to anagrams array
      combinations << letter + reverse_letters(remaining).join('')
    end

    # Create an array to store our anagrams
     anagrams = []

    #So instead of returning that anagrams list right away, we’ll just loop through it and check each of the strings against our database, adding the ones that exist to a new array that we’ll return to the user.
     combinations.each do |combo|
         if Word.find_by_text(combo).present?
             anagrams << combo
         end
     end

# Return anagrams array
    anagrams
end
 
  def self.reverse_letters(letters)
    # create a new array of 2 items
    length = letters.length
    reversed_letters = Array.new(length)
 
    # loop through letters and keep index
    letters.each_with_index do |letter, index|
      reversed_letters[length - index - 1] = letter
    end
 
    reversed_letters
  end
end
