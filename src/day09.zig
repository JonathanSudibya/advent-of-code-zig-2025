const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;

const util = @import("util.zig");
const gpa = util.gpa;

const data = @embedFile("data/day09.txt");

pub fn main() !void {
    const start1 = try Instant.now();
    const result1 = try partOne(data);
    const stop1 = try Instant.now();
    const elapsed1: f64 = @floatFromInt(stop1.since(start1));
    if (result1) |value| {
        print("result1 [{d:.3}ms] : {}", .{ (elapsed1 / time.ns_per_ms), value });
    }
    const start2 = try Instant.now();
    const result2 = try partTwo(data);
    const stop2 = try Instant.now();
    const elapsed2: f64 = @floatFromInt(stop2.since(start2));
    if (result2) |value| {
        print("result2 [{d:.3}ms] : {}", .{ (elapsed2 / time.ns_per_ms), value });
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

fn partOne(input: []const u8) !?u64 {
    var field = try util.allocArrayMxN(i64, gpa, 500, 2);
    defer util.freeArray(gpa, field);
    var f_iter = splitSca(u8, input, '\n');
    var index: usize = 0;
    while (f_iter.next()) |line| {
        if (line.len == 0) {
            continue;
        }

        var l_iter = splitSca(u8, line, ',');
        var inner_idx: usize = 0;
        while (l_iter.next()) |part| {
            field[index][inner_idx] = try parseInt(i64, part, 10);
            inner_idx += 1;
        }

        index += 1;
    }
    var maxSize: u64 = 0;
    for (0..index) |i| {
        for (i + 1..index) |j| {
            const p1 = field[i];
            const p2 = field[j];
            const size: u64 = (@abs(p1[0] - p2[0]) + 1) * (@abs(p1[1] - p2[1]) + 1);
            if (maxSize < size) {
                maxSize = size;
            }
        }
    }
    return @intCast(maxSize);
}

fn partTwo(_: []const u8) !?u64 {
    return null;
}

test "partOne" {
    const example = @embedFile("examples/day09.txt");
    const result = try partOne(example);
    if (result) |value| {
        assert(value == 50);
    }
}

test "partTwo" {
    const example = @embedFile("examples/day09.txt");
    const result = try partTwo(example);
    assert(result == null);
}
