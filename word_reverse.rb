#!/usr/bin/env ruby

#	word_reverse.rb
#	
#	Takes a file of sentences and the reverses the words. Empty lines from the input file will be ignored.
#
#	Example Input File
#	
#		Hello World
#		Hello Giraffe
#
#	Output will look like:
#
#		World Hello
#		Giraffe Hello
#
#	word_reverse.rb example_sentences_to_reverse.txt
#
#	Author: ryanspaulding@gmail.com
###############################


@error_message = "word_reverse.rb takes a single argument of a text file with sentences to reverse.\n\t./word_reverse.rb example_sentences_to_reverse.txt"
@filename = nil

if ARGV.length != 1 or ARGV[0].nil?
	puts @error_message
	exit(1)
else
	@filename = ARGV[0]
	# is it a file we can do anything with? Is it a file at all? 
	unless File.file?(@filename)
		puts "#{@filename} is not a file that word_reverse.rb can use. Please select a different file."
		exit(1)
	end	
end

# extra check
if @filename.nil? 
	puts @error_message
	exit(1)
end

# if you get here we are ready to reverse some words 
File.open(@filename, "r").each do |line|

	# skip any lines with nothing in them
	if line !~ /\w+/
		next
	end

	# need to chomp this
	line = line.chomp
	
	newline = line.rpartition(/[\W\s]/)
	newline.reverse_each { |word| print word }
	# this here for the new line after the sentence 
	puts 
end
