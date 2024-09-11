# C-Zig
Just a simple example of how to use Zig compiler to compile `adder.c` and `main.zig` file that includes a C header file called `adder.h`.
Read the [build.sh](build.sh) file to learn more.

## Build
Just run the `build.sh` script.
```bash
./build.sh
```

## Why a build script?
Zig is capable of compiling C source code. But the problem is Zig compiler needs to know where to find C headers (aka. Include directories like `/usr/include`).
In the command line you can literally do this in project's root directory:
```bash
zig build-exe -I. adder.c main.zig
```
Zig compiler will compile both C and Zig source files into a single executable!

Here, I just included `adder.h` file in `main.zig`. So technically I just need to add the current directory `./` to be searched for header files.
So like C compilers we can use `-I` flag to add a directory to be searched for header files by zig compiler (`-I.`).
Then Zig compiler can find `adder.h`.

In case you want to use libc (like `stdio.h`) you need to find and add system include directories with `-I` flag.
Then you have to link the final executable against libc with `-lc` flag passed to zig compiler. So I created `build.sh` as an example for that.

Note that I didn't initialized any zig project with `zig init` command. If you are created a Zig project all of the things above can be declared in the `build.zig` file.
