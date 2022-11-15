require './app'

def main
  app = App.new
  app.load_data
  puts 'Welcome to Catalog of things!'
  app.run
end

main
