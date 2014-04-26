class Uploader::Wiki
  def initialize word, tamilvu
    @word = word
    @tamilvu = tamilvu
  end

  def exists?
    @tamilvu.get(@word.name) ? true : false
  end

  def create
    if exists?
      @word.existing_in_wiki = true
      @word.save
    else
      @tamilvu.create(@word.name, @word.description)
      @word.uploaded_to_wiki = true
      @word.save
    end
  end
end
