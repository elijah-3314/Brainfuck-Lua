local Brainfuck = {}

Brainfuck.__index = Brainfuck

function Brainfuck.new()
	local self = setmetatable({}, Brainfuck)

	self.dataPointer = 1
	self.instructionPointer = 0
	self.data = {}
	self.stack = {}

	return self
end

function Brainfuck:Run(program)
	while true do
		self.instructionPointer = self.instructionPointer + 1

		local instruction = string.sub(program, self.instructionPointer, self.instructionPointer)

		if instruction == "" then
			break
		end

		if instruction == ">" then
			self.dataPointer = self.dataPointer + 1
		elseif instruction == "<" then
			self.dataPointer = self.dataPointer - 1
		elseif instruction == "+" then
			self.data[self.dataPointer] = (self.data[self.dataPointer] or 0) + 1
		elseif instruction == "-" then
			self.data[self.dataPointer] = (self.data[self.dataPointer] or 0) - 1
		elseif instruction == "." then
			print(string.char(self.data[self.dataPointer]))
		elseif instruction == "," then
			self.data[self.dataPointer] = tonumber(io.read()) or 0
		elseif instruction == "[" then
			table.insert(self.stack, self.instructionPointer)
		elseif instruction == "]" then
			if self.data[self.dataPointer] ~= 0 then
				self.instructionPointer = self.stack[#self.stack]
				goto continue
			end

			self.stack[#self.stack] = nil
		end

		::continue::
	end
end

function Brainfuck:Clear()
	self.dataPointer = 1
	self.instructionPointer = 0
	self.data = {}
	self.stack = {}
end

return Brainfuck
