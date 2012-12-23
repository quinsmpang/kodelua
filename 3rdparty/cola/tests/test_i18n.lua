(function(...)
	args = {...}
	for i=1, #args do
		local pkgPath = package.path  
		package.path = string.format("%s;%s?.lua;%s?/init.lua",  
			pkgPath, args[i], args[i]) 
	end
end)("../")

require "lunit"

local s = require "cola.i18n".Class

module(..., package.seeall, lunit.testcase)

function test_SetNamespace()
	s:SetNamespace("en")
	s:Set("面向对象", "Object-oriented")
	assert_equal(s("面向对象"), "Object-oriented")

	s:SetNamespace("tw")
	s:Set("面向对象", "面向物件")
	assert_equal(s("面向对象"), "面向物件")
end

function test_Set()
	s:SetNamespace("en")
	s:Set("面向对象", "Object-oriented")
	assert_equal(s("面向对象"), "Object-oriented")
end