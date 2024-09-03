require 'sinatra'

def process_page(name)
  (ERB.new(File.read("layout/header.erb")).result(binding)) + \
  (ERB.new(File.read("pages/#{name}.erb")).result(binding)) + \
  (ERB.new(File.read("layout/footer.erb")).result(binding))
end

get '/' do
  process_page 'index'
end

get '/:name.html' do
  # TODO Check if an ERB exists with the name, else redirect to a catch-all page
  process_page params['name']
end

get '/:name' do
  # TODO Check if an ERB exists with the name, else redirect to a catch-all page
  redirect params['name']+'.html'
end
