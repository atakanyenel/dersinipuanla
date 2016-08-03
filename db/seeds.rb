# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

University.create({id:1,name: "Sabancı Üniversitesi", mail: "sabanciuniv.edu"})
Course.create({id:1,name:"CS 201",university_id:1})
Course.create({id:2,name:"ACC 201",university_id:1})
