Class Advent.Day2 Extends %Persistent
{

 
ClassMethod Run(fn="input2.txt", verbose=0) as %Integer{
    
    set stream = ##Class(%Stream.FileCharacter).%New()
	set sc=stream.LinkToFile(fn)
    set sum=0,sum2=0
	while 'stream.AtEnd {
		set line=stream.ReadLine()
		set sum=sum+..MaxMin(line)
        set sum2=sum2+..Divide(line,1)
        if verbose w "line="_line,"sum="_sum,"sum2="_sum2,!
    }
    return sum_","_sum2
}

ClassMethod MaxMin(str as %String,verbose=0) as %Integer {
    set dlm=$C(9)
    for i=1:1:$L(str,dlm) {
        set list($P(str,dlm,i))=""
    }
    set max=$O(list(""),-1)
    set min=$O(list(""))
    return max-min
}

ClassMethod Divide(str as %String,verbose=0) as %Integer{
    set dlm=$C(9)
    for i=1:1:$L(str,dlm) set list($P(str,dlm,i))=""
    set i=$O(list(""))
    while i {
        s k=$O(list(""))
        while k {
            if k=i {
                set k=$O(list(k))  
                Continue
            }
            s div=i/k
            
            if $L(div,".")=1 {
                if verbose w "i="_i,"k="_k,! 
                return div
            }
            set k=$O(list(k))         
        }
        set i=$O(list(i))
    }
     return 0
}


}