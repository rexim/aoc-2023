#import "Basic";
#import "File";
#import "String";

DIGITS := string.[ "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ];

day01 :: (content: string) {
    sum := 0;
    for line: split(content, "\n") {
        if line.count > 0 {
            xs : [..]int;
            for 0..line.count-1 {
                y := line[it];
                if #char "0" <= y && y <= #char "9" {
                    array_add(*xs, y - #char"0");
                }
            }
            if xs.count > 0 {
                x := xs[0]*10 + xs[xs.count-1];
                sum += x;
            }
        }
    }
    print("Day 1: %\n", sum);
}

starts_with_digit :: (s: string) -> int {
    for DIGITS {
        if starts_with(s, it) return it_index + 1;
    }
    return 0;
}

day02 :: (content: string) {
    sum := 0;
    for line: split(content, "\n") {
        if line.count > 0 {
            xs : [..]int;
            for 0..line.count-1 {
                y := line[it];
                if #char "0" <= y && y <= #char "9" {
                    array_add(*xs, y - #char"0");
                } else {
                    y := starts_with_digit(slice(line, it, line.count - it));
                    if y > 0 then array_add(*xs, y);
                }
            }
            if xs.count > 0 {
                x := xs[0]*10 + xs[xs.count-1];
                sum += x;
            }
        }
    }
    print("Day 2: %\n", sum);
}

main :: () {
    content, ok := read_entire_file("input.txt");
    if !ok exit(1);
    day01(content);
    day02(content);
}
