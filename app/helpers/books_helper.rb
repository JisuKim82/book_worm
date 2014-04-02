require 'open-uri'

module BooksHelper

  def find_books
    url = "https://www.goodreads.com/book/most_read"
    page = Nokogiri::HTML(open(url)) 
    books = page.css('div.leftContainer table.tableList tr td a.bookTitle span')
    titles = []
    books.each do |book|
      Book.create(title: book.text)
    end
  end

  def find_single_isbn(book)
    title = book.title
    book_info = GoogleBooks.search(title).first
    book.isbn = book_info.isbn
    
  end

  def find_isbn
    title = Book.all.sample.title
    book_obj = {title:"", release_date: "", isbn:"", excerpt:"", authors:""}
    # book_info = nil
    # while !book_info
    #   book_info = GoogleBooks.search(title).first
    # end
    book_info = GoogleBooks.search(title, :api_key => ENV["GOOGLE_BOOKS_API"]).first
    book_obj = {title: book_info.title, release_date: book_info.published_date, isbn: book_info.isbn, excerpt:book_info.preview_link, authors:book_info.authors_array}
    book_obj[:isbn]
  end

  # def otherwise
  #   book_info = GoogleBooks.search("POODR").first
  # end

end
