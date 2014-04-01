require 'spec_helper'

describe "books/index" do
  before(:each) do
    assign(:books, [
      stub_model(Book,
        :title => "Title",
        :author => "Author",
        :isbn => "Isbn",
        :release_date => "Release Date",
        :excerpt => "Excerpt"
      ),
      stub_model(Book,
        :title => "Title",
        :author => "Author",
        :isbn => "Isbn",
        :release_date => "Release Date",
        :excerpt => "Excerpt"
      )
    ])
  end

  it "renders a list of books" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Isbn".to_s, :count => 2
    assert_select "tr>td", :text => "Release Date".to_s, :count => 2
    assert_select "tr>td", :text => "Excerpt".to_s, :count => 2
  end
end
