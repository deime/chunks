# Ok, this is very ugly, but it works...

file = File.open("src.css")

$code = ""

def conc(line)
  line.gsub!( / *(\{|\}|;|:|\+|,|\.) */) { $&.gsub " ", "" }
  line.gsub!( ";}", "}" )
  
  line.gsub!( "\t", "" )
  line.gsub!( "\n", "" )
  $code += line
end
file.each {|line| conc line}

$code.gsub! /\/\*.*?\*\//, ""

$code = "/* (c) 2009, Jeremy Pinat. */ #{$code}"

file = File.open("chunks.css", "w")
file.puts $code

