module Functions
  module LogbooksHelper
    def paperclip_blob_file(param, name)
      file = Paperclip.io_adapters.for(param)
      file.original_filename = name
      file
    end
  end
end
