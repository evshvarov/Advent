Class Advent.Day4 Extends %RegisteredObject
{

 
ClassMethod Part1(fn="input4.txt", verbose=0) as %Integer{
    
    set stream = ##Class(%Stream.FileCharacter).%New()
	set sc=stream.LinkToFile(fn)
    set counter=0,l=0
    while 'stream.AtEnd {
        set line=stream.ReadLine()
        set valid=1
        for i=1:1:$L(line," ") {
            set word=$P(line," ",i)
            if $D(line(word)) {
                set valid=0 
                quit
            }
            s line(word)=""
        }
        if valid,$seq(counter)
        if verbose,$seq(l) write "line="_line," counter="_counter," linenum="_l,!
        k line
    }
    return counter
}

ClassMethod Part2(fn="input4.txt", verbose=0) as %Integer{
    set stream = ##Class(%Stream.FileCharacter).%New()
	set sc=stream.LinkToFile(fn)
    set counter=0,l=0
    while 'stream.AtEnd {
        set line=stream.ReadLine()
        set valid=1
        // place words in local
        for i=1:1:$L(line," ") s line(i)=$P(line," ",i)
        
        for i=1:1:$L(line," ") {
            for k=1:1:$L(line," ") {
                if k=i continue
                if ..IsAnagram(line(i),line(k)) {
                    set valid=0
                    quit
                }
            }

        }
        if valid,$seq(counter)
        if verbose,$seq(l) write "line="_line," counter="_counter," linenum="_l,!
        k line
    }
    return counter
}

ClassMethod IsAnagram(word,test) as %Boolean {
    if $L(word)'=$L(test) return 0
    f i=1:1:$L(test) if $seq(test($E(test,i))),$seq(word($E(word,i)))
    //f i=1:1:$L(word) if $seq(word($E(word,i)))
    set a=$O(word(""))
    while a'="" {
        if word(a)'=$g(test(a)) return 0
        set a=$O(word(a))
    }
    return 1
}

}