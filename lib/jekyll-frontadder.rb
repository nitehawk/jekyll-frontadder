# This plugin adds up build hours from each build log entry and pushes a
# running total on each post
#
# V1 only handles hour summary
#
# TODO: Extend to process multiple types of efforts
module JekyllFrontAdder
  # Here's our work horse class
  class JekyllFrontAdderGen < Jekyll::Generator
    def initialize(*)
      @hours = { 'total' => 0 }
      @parts = { 'total' => 0 }
      @types = { 'total' => 0 }
      @hours.default = 0
      @parts.default = 0
      @types.default = 0
    end

    def generate(site)
      site.posts.docs.each do |post|
        next if post.data['layout'] != 'buildlog'
        Jekyll.logger.debug 'Processing: ', post.url
        posthours = post.data['hours']
        @hours['total'] = @hours['total'] + posthours['total']
        post.data['tothours'] = { 'total' => @hours['total'], 'part' => @parts, 'type' => @types }
      end
    end

    # This will add two hases together and return the result
    def addhashes(h1, h2)
    end
  end
end
