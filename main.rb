require 'sinatra'

def process_page(name)
  (ERB.new(File.read("layout/header.erb")).result(binding)) + \
  (ERB.new(File.read("pages/#{name}.erb")).result(binding)) + \
  (ERB.new(File.read("layout/footer.erb")).result(binding))
end

get '/' do
  process_page 'index'
end

get '/:name' do
  process_page params['name']
end
