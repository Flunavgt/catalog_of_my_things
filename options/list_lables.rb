require_relative '../classes/label'

def list_labels
  puts 'LABELS'
  @labels.each do |label|
    puts "Title: #{label.title}, Color: #{label.color}"
    sleep(2)
  end
end
