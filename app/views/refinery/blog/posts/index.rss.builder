xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title Refinery::Core.config.site_name
    xml.description Refinery::Core.config.site_name + " Blog Posts"
    xml.link main_app.refinery_blog_root_url

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.body
        xml.pubDate post.published_at.to_s(:rfc822)
        xml.link main_app.refinery_blog_post_url(post)
      end
    end
  end
end