const std = @import("std");
const adder = @cImport({
    @cInclude("adder.h");
});

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const sum = adder.add(10, 20);

    try stdout.print("sum = {d}\n", .{sum});
}
