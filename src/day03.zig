const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;

const util = @import("util.zig");
const gpa = util.gpa;

const data = @embedFile("data/day03.txt");

pub fn main() !void {
    const start1 = try Instant.now();
    const result1 = try partOne(data);
    const stop1 = try Instant.now();
    const elapsed1: f64 = @floatFromInt(stop1.since(start1));
    if (result1) |value| {
        print("result1 [{d:.3}] : {}", .{ (elapsed1 / time.ns_per_ms), value });
    }
    const start2 = try Instant.now();
    const result2 = try partTwo(gpa, data);
    const stop2 = try Instant.now();
    const elapsed2: f64 = @floatFromInt(stop2.since(start2));
    if (result2) |value| {
        print("result2 [{d:.3}] : {}", .{ (elapsed2 / time.ns_per_ms), value });
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

const time = std.time;
const Instant = time.Instant;

// Generated from template/template.zig.
// Run `zig build generate` to update.
// Only unmodified days will be updated.

fn partOne(_: []const u8) !?u64 {
    return null;
}

fn partTwo(_: []const u8) !?u64 {
    return null;
}

test "partOne" {
    const example = @embedFile("examples/day03.txt");
    const result = try partOne(example);
    assert(result == null);
}

test "partTwo" {
    const example = @embedFile("examples/day03.txt");
    const result = try partTwo(example);
    assert(result == null);
}
