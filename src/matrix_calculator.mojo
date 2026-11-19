# SHAE Mojo Matrix Calculator
# Authentic Mojo syntax - matrix/tensor operations

from builtins import Int, Float64, String, Range, print
from algorithms.sort import sort

struct Matrix:
    rows: Int
    cols: Int
    data: List[List[Float64]]

    fn __init__(inout self, rows: Int, cols: Int):
        self.rows = rows
        self.cols = cols
        var data = List[List[Float64]]()
        var i = 0
        while i < rows:
            var row = List[Float64]()
            var j = 0
            while j < cols:
                row.append(0.0)
                j += 1
            data.append(row)
            i += 1
        self.data = data

    fn get(self, r: Int, c: Int) -> Float64:
        return self.data[r][c]

    fn set(inout self, r: Int, c: Int, value: Float64):
        self.data[r][c] = value

    fn add(inout self, other: Matrix) -> Matrix:
        result = Matrix(self.rows, self.cols)
        var i = 0
        while i < self.rows:
            var j = 0
            while j < self.cols:
                result.set(i, j, self.get(i, j) + other.get(i, j))
                j += 1
            i += 1
        return result

    fn multiply(inout self, other: Matrix) -> Matrix:
        result = Matrix(self.rows, other.cols)
        var i = 0
        while i < self.rows:
            var j = 0
            while j < other.cols:
                var sum = 0.0
                var k = 0
                while k < self.cols:
                    sum = sum + self.get(i, k) * other.get(k, j)
                    k += 1
                result.set(i, j, sum)
                j += 1
            i += 1
        return result

    fn transpose(inout self) -> Matrix:
        result = Matrix(self.cols, self.rows)
        var i = 0
        while i < self.rows:
            var j = 0
            while j < self.cols:
                result.set(j, i, self.get(i, j))
                j += 1
            i += 1
        return result

    fn print_matrix(self):
        var i = 0
        while i < self.rows:
            var j = 0
            while j < self.cols:
                print(self.get(i, j), end=" ")
                j += 1
            print()
            i += 1

fn main():
    print("SHAE Mojo Matrix Calculator")
    print("Matrix/tensor operations available:")
    print("  - add")
    print("  - multiply")
    print("  - transpose")
    print("Usage: Build with mojo compiler and run matrix_calculator.mojo")
