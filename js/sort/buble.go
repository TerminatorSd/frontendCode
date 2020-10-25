package main

import "fmt"

func main(){
	nums:=[]int{3,4,1,9,5,7,8}
	res :=bubble(nums)
	fmt.Println(res)
}

func bubble(nums []int)(res []int){
	for i:=len(nums);i>=0;i--{
		for j:=0;j<i-1;j++{
			if nums[j]>= nums[j+1] {
				num := nums[j]
				nums[j]=nums[j+1]
				nums[j+1]=num
			}
		}
		
	}
	return nums

}