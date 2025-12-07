const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;

const util = @import("util.zig");
const gpa = util.gpa;

const data = @embedFile("data/day24.txt");

pub fn main() !void {
    const result1 = partOne(gpa, data);
    if (result1) |value| {
        print("result1 : {}", value);
    }
    const result2 = partTwo(gpa, data);
    if (result2) |value| {
        print("result2 : {}", value);
    }
}

// Useful stdlib functions
const tokenizeAny = std.mem.tokenizeAny;
const tokenizeSeq = std.mem.tokenizeSequence;
const tokenizeSca = std.mem.tokenizeScalar;
const splitAny = std.mem.splitAny;
const splitSeq = std.mem.splitSequence;
const splitSca = std.mem.splitScalar;
const indexOf = std.mem.indexOfScalar;
const indexOfAny = std.mem.indexOfAny;
const indexOfStr = std.mem.indexOfPosLinear;
const lastIndexOf = std.mem.lastIndexOfScalar;
const lastIndexOfAny = std.mem.lastIndexOfAny;
const lastIndexOfStr = std.mem.lastIndexOfLinear;
const trim = std.mem.trim;
const sliceMin = std.mem.min;
const sliceMax = std.mem.max;

const parseInt = std.fmt.parseInt;
const parseFloat = std.fmt.parseFloat;

const print = std.debug.print;
const assert = std.debug.assert;

const sort = std.sort.block;
const asc = std.sort.asc;
const desc = std.sort.desc;

// Generated from template/template.zig.
// Run `zig build generate` to update.
// Only unmodified days will be updated.

fn partOne(_: Allocator, _: []const u8) ?u64 {
    return null;
}

fn partTwo(_: Allocator, _: []const u8) ?u64 {
    return null;
}

test "partOne" {
    const example = @embedFile("examples/day24.txt");
    const result = partOne(gpa, example);
    assert(result == null);
}

test "partTwo" {
    const example = @embedFile("examples/day24.txt");
    const result = partTwo(gpa, example);
    assert(result == null);
}
