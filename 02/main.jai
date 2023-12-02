#import "Basic";
#import "File";
#import "String";

strip_prefix :: (s: string, prefix: string) -> string {
    if starts_with(s, prefix) {
        return slice(s, prefix.count, s.count - prefix.count);
    } else {
        return s;
    }
}

day01 :: (content: string) {
    ans := 0;
    for line: split(content, "\n") {
        if line.count > 0 {
            chunks := split(line, ": ");
            game_id := to_integer(strip_prefix(chunks[0], "Game "));
            red := 0;
            green := 0;
            blue := 0;
            for set: split(chunks[1], "; ") {
                for group: split(set, ", ") {
                    group_chunks := split(group, " ");
                    if group_chunks[1] == {
                        case "red";   red = max(red, to_integer(group_chunks[0]));
                        case "green"; green = max(green, to_integer(group_chunks[0]));
                        case "blue";  blue = max(blue, to_integer(group_chunks[0]));
                        case; assert(false, "unreachable");
                    }
                }
            }

            if red <= 12 && green <= 13 && blue <= 14 {
                ans += game_id;
            }
        }
    }

    print("Day 1: %\n", ans);
}

day02 :: (content: string) {
    ans := 0;
    for line: split(content, "\n") {
        if line.count > 0 {
            chunks := split(line, ": ");
            game_id := to_integer(strip_prefix(chunks[0], "Game "));
            red := 0;
            green := 0;
            blue := 0;
            for set: split(chunks[1], "; ") {
                for group: split(set, ", ") {
                    group_chunks := split(group, " ");
                    if group_chunks[1] == {
                        case "red";   red = max(red, to_integer(group_chunks[0]));
                        case "green"; green = max(green, to_integer(group_chunks[0]));
                        case "blue";  blue = max(blue, to_integer(group_chunks[0]));
                        case; assert(false, "unreachable");
                    }
                }
            }
            ans += red*green*blue;
        }
    }

    print("Day 2: %\n", ans);
}

main :: () {
    content, ok := read_entire_file("input.txt");
    if !ok exit(1);

    day01(content);
    day02(content);
}
