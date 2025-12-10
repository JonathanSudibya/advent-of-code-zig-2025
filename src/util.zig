const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;
const Str = []const u8;

var gpa_impl = std.heap.GeneralPurposeAllocator(.{}){};
pub const gpa = gpa_impl.allocator();

// Add utility functions here

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

pub fn allocArray(comptime T: type, allocator: std.mem.Allocator, comptime n: usize) std.mem.Allocator.Error![][]T {
    return try allocArrayMxN(T, allocator, n, n);
}

pub fn allocArrayMxN(comptime T: type, allocator: std.mem.Allocator, comptime m: usize, comptime n: usize) std.mem.Allocator.Error![][]T {
    var arr = try allocator.alloc([]T, m);
    var rows: usize = 0;
    errdefer {
        for (0..rows) |i| {
            allocator.free(arr[i]);
        }
        allocator.free(arr);
    }

    while (rows < m) : (rows += 1) {
        arr[rows] = try allocator.alloc(T, n);
    }
    return arr;
}

pub fn freeArray(allocator: std.mem.Allocator, arr: anytype) void {
    for (0..arr.len) |i| {
        allocator.free(arr[i]);
    }
    allocator.free(arr);
}
