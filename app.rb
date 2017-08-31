require 'sinatra'
require 'ostruct'
require 'word_bunny'

get '/' do
  @sample_text_title = "Example: President Duterte's State of the Nation Address 2017"
  @speech = File.read('./SONA2017.txt')
  @results = tally! @speech
  haml :index, format: :html5
end

get '/2013' do
  @sample_text_title = "Example: President Aquino's State of the Nation Address 2013"
  @speech = File.read('./SONA2013.txt')
  @results = tally! @speech
  haml :index, format: :html5
end

post '/' do
  @results = tally! params['text']
  @debug = params['text']
  haml :index, format: :html5
end

def tally! text
  results = WordBunny::TalliesWords.execute(text)
  results.map! {|arr| OpenStruct.new(word: arr[0], count: arr[1])}
end
