#!/usr/bin/env ruby

require 'cssmin'

class CssCrusher
  def initialize(source_file)
    @raw_code = File.open(source_file).read
    @minified_code = CSSMin::minify @raw_code
  end

  def save_as(output_file)
    file = File.open(output_file,"w").puts(@minified_code)
  end
end

chunks = CssCrusher.new "../src.css"
chunks.save_as "../chunks.css"