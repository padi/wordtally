require 'sinatra'
require 'ostruct'
require 'word_bunny'

get '/' do
  @results = Array(@results)
  haml :index, format: :html5
end

post '/' do
  @results = WordBunny::TalliesWords.execute(params['text'])
  @results.map! {|arr| OpenStruct.new(word: arr[0], count: arr[1])}
  @debug = params['text']
  haml :index, format: :html5
end
