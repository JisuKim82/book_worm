desc "This task scrapes Goodreads and saves books"
task :save_from_goodreads => :environment do
  Book.save_books
end

# task :save_from_goodreads_list, :url => :environment do |t, url|
#   Book.save_books_for(url)
# end
