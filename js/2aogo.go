package main

import ("fmt"
"strings"
"strconv"
)


func main() {
	str := "a(b(c)<2>d)<3>e"
	// findContentBetween("<", ">", str, 10)
    for strHasKuoHao(str) {
		str = replaceStrContent(str)
	}
	fmt.Println(str)
}

func getResContent(str string, num int) (result string) {
	for i := 0; i < num; i++ {
		result = result + str
	}
	return result
}

// func findContentBetween(left string, right string, str string, index int) (content string, num int) {
// 	leftIndex := 0
// 	rightIndex := 0
// 	isFirstOne := true
// 	leftNum := 0
// 	for i := index; i < len(str); i++ {
// 		if (string(str[i]) == left) {
// 			if (isFirstOne) {
// 				isFirstOne = false
// 				leftIndex = i + 1
// 			}
// 			leftNum++
// 		}
// 		if (string(str[i]) == right) {
// 			leftNum--
// 			if (leftNum == 0) {
// 				rightIndex = i - 1
// 				break
// 			}
// 		}
// 	}
// 	content = str[leftIndex:rightIndex + 1]
// 	num = rightIndex
// 	return
// }

func indexFunc(left string, str string, index int) (num int) {
	for i:= index + 1; i < len(str); i++ {
		if (string(str[i]) == left) {
			num = i + 1
			break
		}
	}
	return 
}

func findContentBetween(characterLeft string,characterRight string,str string,index int)(content string,num int){
	var countCharacter int
	var firstLeftIndex,lastRightIndex int

	firstLeftIndex = indexFunc(characterLeft, str, index)
	// firstLeftIndex =strings.Index(str,characterLeft)
	for i:=index; i<len(str); i++{
		if string(str[i])==characterLeft{
			countCharacter++
		}else if string(str[i])==characterRight{
			countCharacter--
			if countCharacter == 0{
				lastRightIndex = i
				break
			}
		}
	}
	content = str[firstLeftIndex:lastRightIndex]
	num = lastRightIndex
	// fmt.Println("xxx")
	// fmt.Println(content,num)
	return
}



func replaceStrContent(str string) string {
	theContent, index := findContentBetween("(", ")", str, 0)
	// fmt.Println(theContent,index)
	repeatNum, _:= findContentBetween("<", ">", str, index)
	// fmt.Println(index2)
	// contentLastIndex:=strings.Index(str,theContent)
	// fmt.Println(contentLastIndex)
	// repeatNum:=str[contentLastIndex+2]
	// fmt.Println("repeat",repeatNum)
	repeatNumInt,_ := strconv.Atoi(string(repeatNum))
	toReplaceContent := "(" + theContent + ")<" + repeatNum + ">"
	resContent := getResContent(theContent, repeatNumInt)

	// fmt.Println(resContent)

	res :=strings.Replace(str,toReplaceContent, resContent,-1)
	return res
}

func strHasKuoHao(str string) bool {
	 index := strings.Index(str,"(")
	 if index == -1 {
		 return false
	 }
	return true
}