# Brainfuck Interpreter in Lua

This is a simple Brainfuck interpreter implemented in Lua. It supports all Brainfuck commands, including input and output operations.

## Features
- Supports all Brainfuck commands (`>`, `<`, `+`, `-`, `[`, `]`, `,`, `.`)
- Allows execution of Brainfuck programs

## Installation
Clone this repository or download the `Brainfuck.lua` file and require it in your Lua script.

```lua
local Brainfuck = require("Brainfuck")
```

## Usage
Create a new Brainfuck interpreter instance and run a program:

```lua
local Brainfuck = require("Brainfuck")

local myBrainfuck = Brainfuck.new()
myBrainfuck:Run(
    [[++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++.]]
)
```

### Hello World Example
The following program prints `Hello World!`:

```lua
myBrainfuck:Run(
    [[
        ++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.
    ]]
)
```

### Resetting the Interpreter
To reset the Brainfuck interpreter:

```lua
myBrainfuck:Clear()
```

## Brainfuck Commands
| Command | Description |
|---------|-------------|
| `>`     | Move data pointer to the right |
| `<`     | Move data pointer to the left |
| `+`     | Increment the value at the data pointer |
| `-`     | Decrement the value at the data pointer |
| `.`     | Output the character at the data pointer |
| `,`     | Read a character from input and store it at the data pointer |
| `[`     | Jump past matching `]` if value at data pointer is zero |
| `]`     | Jump back to matching `[` if value at data pointer is nonzero |

## License
This project is licensed under the MIT License.

## References
- [Brainfuck - Wikipedia](https://en.wikipedia.org/wiki/Brainfuck)

