package main

import ("fmt"
"strings"
"bytes"
"encoding/binary"
)

func main() {
    // fmt.Println("Hello, World!")
    res:=find("ab(c)<2>d")
    fmt.Println(res)
}

func find(str string)(res string){
    firstIndex:=strings.IndexAny(str,"(")
    fmt.Println(firstIndex)
    fmt.Println(str[:firstIndex])
    lastIndex:=strings.LastIndex(str,")")
    fmt.Println(lastIndex)
    fmt.Println(str[firstIndex+1:lastIndex])
    repeatTimes := str[lastIndex+2]
    fmt.Println(repeatTimes)

    return res
}

func BytesToInt(bys byte) int {
    bytebuff := bytes.NewBuffer(bys)
    var data int64
    binary.Read(bytebuff, binary.BigEndian, &data)
    return int(data)
}