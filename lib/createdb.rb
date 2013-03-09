require 'neo4j-core'
require 'fileutils'
require_relative 'page/people'

DB = '../db/ccc'
FileUtils.rm_rf(DB)
Neo4j::Config[:storage_path] = DB
puts "Neo4j version: #{Neo4j::NEO_VERSION}"
peoplePage = ChicagoCityCouncil::PeoplePage.new
peoplePage.people.each do |person|
  Neo4j::Transaction.run do
    node = Neo4j::Node.new(:name => person.name, :role => person.role, :url => person.url)
    Neo4j.ref_node.outgoing(:people) << node
    end
end
puts "People: #{Neo4j.ref_node.outgoing(:people).count}"
Neo4j.ref_node.outgoing(:people).each do |node|
  puts "Node: #{node[:name]}"
end
