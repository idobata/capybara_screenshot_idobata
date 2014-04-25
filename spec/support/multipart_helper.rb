require 'multipart_parser/reader'

module MultipartHelper
  def parse_multipart(req)
    content_type = req.headers['Content-Type']
    boundary     = MultipartParser::Reader.extract_boundary_value(content_type)
    params       = {}

    reader = MultipartParser::Reader.new(boundary)
    reader.on_part do |part|
      params[part.name] = {part: part, data: ''}
      part.on_data do |data|
        params[part.name][:data] << data
      end
    end
    reader.write req.body

    params
  end
end
