const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;

const util = @import("util.zig");
const gpa = util.gpa;

const data = @embedFile("data/day01.txt");

pub fn main() !void {
    const start1 = try Instant.now();
    const result1 = try partOne(data);
    const stop1 = try Instant.now();
    const elapsed1: f64 = @floatFromInt(stop1.since(start1));
    if (result1) |value| {
        print("result1 [{d:.3}ms] : {}\n", .{ (elapsed1 / time.ns_per_ms), value });
    }
    const start2 = try Instant.now();
    const result2 = try partTwo(data);
    const stop2 = try Instant.now();
    const elapsed2: f64 = @floatFromInt(stop2.since(start2));
    if (result2) |value| {
        print("result2 [{d:.3}ms] : {}\n", .{ (elapsed2 / time.ns_per_ms), value });
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
const parseUnsigned = std.fmt.parseUnsigned;

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
    var lock_position: i64 = 50;
    var result: u64 = 0;

    var start: usize = 0;
    for (0.., input) |i, c| {
        if (c != '\n') {
            continue;
        }

        const line = input[start..i];
        start = i + 1;

        if (line.len == 0) {
            continue;
        }

        const move_size: i64 = try parseInt(i64, line[1..], 10);
        switch (line[0]) {
            'L' => {
                lock_position = @mod((lock_position - move_size), 100);
                if (lock_position < 0) {
                    lock_position += @as(i64, 100);
                }
            },
            'R' => {
                lock_position = @mod((lock_position + move_size), 100);
            },
            else => {
                unreachable;
            },
        }

        if (lock_position == 0) {
            result += 1;
        }
    }

    return result;
}

fn partTwo(input: []const u8) !?u64 {
    var lock_position: i64 = 50;
    var result: u64 = 0;

    var start: usize = 0;
    for (0.., input) |i, c| {
        if (c != '\n') {
            continue;
        }

        const line = input[start..i];
        start = i + 1;

        if (line.len == 0) {
            continue;
        }

        const move_size: i64 = try parseInt(i64, line[1..], 10);
        const previous_position: i64 = lock_position;
        var rotation_times: u64 = @intCast(@divFloor(move_size, 100));

        switch (line[0]) {
            'L' => {
                lock_position -= @mod(move_size, 100);
            },
            'R' => {
                lock_position += @mod(move_size, 100);
            },
            else => {
                unreachable;
            },
        }

        if (lock_position < 0) {
            lock_position += 100;
            if (previous_position != 0) {
                rotation_times += 1;
            }
        } else if (lock_position > 99) {
            lock_position -= 100;
            if (previous_position != 0) {
                rotation_times += 1;
            }
        } else if (lock_position == 0 and previous_position != 0) {
            rotation_times += 1;
        }

        result += @as(u64, rotation_times);
    }

    return result;
}

test "partOne" {
    const example = @embedFile("examples/day01.txt");
    const result = try partOne(example);
    if (result) |value| {
        assert(value == 3);
    }
}

test "partTwo" {
    const example = @embedFile("examples/day01.txt");
    const result = try partTwo(example);
    if (result) |value| {
        assert(value == 6);
    }
}
