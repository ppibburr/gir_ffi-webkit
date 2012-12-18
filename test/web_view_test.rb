require File.expand_path('test_helper.rb', File.dirname(__FILE__))

Gtk.init []
describe WebKit::WebView do
  describe "#get_title" do
    it "returns the document title, String" do
      wv = WebKit::WebView.new
      wv.load_html_string("<html><head><title>Test WebView</title></head><body></body></html>",'')
      wv.signal_connect "load-finished" do
        assert wv.get_title=="Test WebView",wv.get_title
        Gtk.main_quit
      end
      Gtk.main
    end
  end
end
