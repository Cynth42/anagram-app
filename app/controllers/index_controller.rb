def three_letters?(input)
    if input.length > 3
        false
    else
       true
    end
end

def distinct_letters?(input)
    letter_array = input.chars
    unique_letters = letter_array.uniq
    if unique_letters.length < letter_array.length
        false
    else
       true
    end
end

def valid_input?(input)
    if three_letters?(input) && distinct_letters?(input)
        true
    else
        false
    end
end
    
get '/' do
  erb :index
end

get '/anagrams/:word' do
    @word = params[:word]
    @anagrams = Word.find_anagrams(@word)
    erb :show
end

post '/' do
    word = params[:word]
       if valid_input?(word)
        redirect "/anagrams/#{word}"
        else
        # create an @error variable with an error message
        @error = "Word must be less than or equal to 3 characters."
        # then render the index page again
        erb :index
    end
end


    
