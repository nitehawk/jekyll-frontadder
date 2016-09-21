# This Jekyll Generator plugin looks for specified hashes in a post's front matter and adds them up.
# The final result is stored into the site's data tree for use in layouts
module Jekyll
  # Here's our work horse class
  class JekyllFrontAdderGen < Jekyll::Generator
    # Called by Jekyll to run our plugin
    def generate(site)
      # Pickup array of frontmatter things to add up
      frontadd = site.config["frontadder"]
      if frontadd.nil?
        Jekyll.logger.warn 'Frontadder: frontadder not defined in _config.yml, skipping'
        return
      end
      Jekyll.logger.debug 'Frontadder: Will add listed hashes: ', frontadd

      # Initialize hashes for each hash to add
      frontadd.each do |addme|
        site.config[addme] ||= {}
      end

      # For each post, loop through the list of hashes to add and do it.
      site.posts.docs.each do |post|
        Jekyll.logger.debug 'Processing: ', post.url
        frontadd.each do |addme|
          next unless post.data[addme].respond_to?(:merge)
          site.config[addme] = addhashes(site.config[addme], post.data[addme])
          post.data[addme]['runtotal'] = site.config[addme]
        end
      end
    end

    private

    # This will add two hases together and return the result - recursive
    def addhashes(h1, h2)
      if h1.respond_to?(:merge) && h2.respond_to?(:merge)
        return h1.merge(h2) { |_key, old, new| addhashes(old, new) }
      else
        return h1 + h2
      end
    end
  end
end
