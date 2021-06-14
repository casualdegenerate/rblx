local calc = function(n1,equ,op)
  -- // This is my method of algebra. IF there is one number and one X on one side and a set sol on other side for now.
	if op == "*" then 
		op = "/"
	elseif op == "/" then
		op = "*"
	elseif op == "+" then
		op = "-"
	elseif op == "-" then
		op = "+"
	end
	return loadstring('return ' .. equ .. op .. n1)() -- // This function will run with arguments to do maths and return the result. Which is pretty much what you'd do in math class to do your maths.	
end
print(calc(75,25,"+"))
-- //Cool
