package;

import haxe.macro.Expr.ExprOf;

class Util {
    /**
     * Reads a file into an array of lines at compile time
     * Removes empty lines
    **/
    public static macro function getFile(path:String):ExprOf<Array<String>> {
        // @formatter:off
        return macro $a{
            sys.io.File.getContent(path)
                .split("\n")
                .filter(line -> line.length >= 1)
                .map(line -> macro $v{line})
        };
        // @formatter:on
    }
}
