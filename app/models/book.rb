class Book < ActiveRecord::Base

    attr_accessor :find_books, :find_isbn
    
    def find_books
      url = "https://www.goodreads.com/book/most_read"
      page = Nokogiri::HTML(open(url)) 
        books = page.css('div.leftContainer table.tableList tr td a span')
        @titles = []
        books.each do |book|
          @titles << book.text
        end
    end
    def find_isbn
        title = @titles.sample
        @book = {title:"", release_date: "", isbn:"", excerpt:"", authors:""}
        book_info = GoogleBooks.search(title).first
        @book = {title: book_info.title, release_date: book_info.published_date, isbn: book_info.isbn, excerpt:book_info.preview_link, authors:book_info.authors_array}
        @isbn = @book[:isbn]
        p @book
    end
end
