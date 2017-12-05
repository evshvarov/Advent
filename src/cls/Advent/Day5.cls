Class Advent.Day5 Extends %RegisteredObject
{

 
ClassMethod Part1(fn="input5.txt", verbose=0) as %Integer{
    
    set stream = ##Class(%Stream.FileCharacter).%New()
	set sc=stream.LinkToFile(fn)
    set counter=0
    while 'stream.AtEnd {
		set maze($seq(length))=stream.ReadLine()
    }
    set position=1
cycle 
    if $seq(step)
    set move=maze(position)
    set maze(position)=move+1
    if verbose w "step=",step," move=",move," position=",position," maze()=",maze(position),!
    if move+position>length return step
    set position=move+position
    goto cycle
}

ClassMethod Part2(fn="input5.txt", verbose=0) as %Integer{
    
    set stream = ##Class(%Stream.FileCharacter).%New()
	set sc=stream.LinkToFile(fn)
    set counter=0
    while 'stream.AtEnd {
		set maze($seq(length))=stream.ReadLine()
    }
    set position=1
cycle 
    if $seq(step)
    set move=maze(position)
    set maze(position)=move+$S(move>2:-1,1:+1)
    if verbose w "step=",step," move=",move," position=",position," maze()=",maze(position),!
    if move+position>length return step
    set position=move+position
    goto cycle
}


}