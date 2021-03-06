class Blog
  attr_reader :entries
  attr_writer :post_source

  def initialize 
    @entries = [] 
  end
  def title
    "watching paint dry"
  end
  def subtitle
    "the trusted source for drying paint and news opinion"
  end

  def add_entry entry
    entries << entry
    
  end

  def new_post(*args)
    post_source.call(*args).tap do |p|
      p.blog = self
    end
  end

  private
  def post_source
    @post_source ||= Post.public_method(:new)
  end
end
