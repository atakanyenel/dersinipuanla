# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

University.create({id:1,name: "Sabancı Üniversitesi", mail: "sabanciuniv.edu"})
Course.create([{name:"CS 201",university_id:1},{name:"MATH 201",university_id:1},
		{name:"MATH 203",university_id:1},{name:"MATH 101",university_id:1},
		{name:"MATH 102",university_id:1},{name:"MATH 204",university_id:1},
		{name:"CS 204",university_id:1},{name:"CS 300",university_id:1},
		{name:"CS 301",university_id:1},{name:"CS 307",university_id:1},
		{name:"SPS 101",university_id:1},{name:"SPS 102",university_id:1},
		{name:"SPS 303",university_id:1},{name:"NS 101",university_id:1},
		{name:"NS 102",university_id:1},{name:"TLL 101",university_id:1},
		{name:"TLL 102",university_id:1},{name:"ENG 101",university_id:1},
		{name:"ENG 102",university_id:1},{name:"ENS 208",university_id:1}])
