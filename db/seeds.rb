require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'generic_food.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    t = Food.new
    t.name = row['name']
    t.category = row['category']
    #t.subcategory = row['sub-category']
    t.save
    puts "#{t.name}, #{t.category} saved"
end
puts "There are now #{Food.count} rows in the Food table"