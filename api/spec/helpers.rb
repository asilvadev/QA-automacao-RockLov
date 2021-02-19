module Helpers
  def get_thumb(filename)
    return File.open(File.join(Dir.pwd, "spec/fixtures/images", filename), "rb")
  end

  module_function :get_thumb
end
