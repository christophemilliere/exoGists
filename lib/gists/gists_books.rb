module Gists
  class GistsBook
    def initialize(name,pwd)
      @client = Octokit::Client.new(:login => name, :password => pwd)
    end

    def get_gists_all
      begin
        return @client.gists
      rescue
        return false
      end

    end
    def get_user
      begin
        return @client.user
      rescue
        return false
      end

    end

    #return array with names gists
    def get_name_all_gists
      files = @client.gists.map{|g| g[:files] }.map{|f| f.to_h.keys }
      files_names = files.flatten.map(&:to_s)
      return files_names
    end

    #return number elements
    def gists_count
      return @client.gists.count
    end
  end
end
