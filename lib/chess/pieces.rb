require_relative 'pieces/piece'
Dir[File.dirname(__FILE__) + '/pieces/*.rb'].each {|file| require file }
