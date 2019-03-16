// 03. 문자와 문자열
import Cocoa

//문자 선언하기
let char:Character="a" //유니코드 문자도 입력 가능하며, 유니코드로 직접 입력도 가능하다.
//let char2:Character="abc"//당연히 문자열은 넣을 수 없다

//문자 비교
let char2:Character="\u{2665}"
print(char2=="\u{2665}")
print(char>char2)//크기도 비교가 가능하다

//문자열 선언하기
var str1="Hello my name is chacha"
var str2:String="Swift"

var i = 1
var j = 3
let str3="1+2=\(i+j)"//변수도 대입할 수 있다
print(str3)

//타입변환도 가능하다
let strFromInt = String(100)
let strFromBool=String(true)
let strFromChar=String(char)

//형식에 맞는 문자열 만들기 -> Foundation Framework 필요
import Foundation
String(format: "%03d",12)
String(format: "%3.2f",3.14159)
String(format: "%3.2e",3.14159)

//문자열 추가
var str11 = "Hello"
str11 = str11 + " Swift" //+연산자를 사용한 경우
str11 += "!"
print(str11)

var str22 = "me"
str22.append(" so hungy")
let exclaim:Character="!"
str22.append(exclaim)

//문자열 비교
if(str11=="Hello Swift!"){
    print("같은 문자열")
}
//문자열 시작, 끝 비교
str11.hasPrefix("Hello") //시작
str11.hasSuffix("ground")//끝

//compare함수 사용 시 비교 옵션/범위/로케일을 줄 수 있고
// 비교 결과는 오름차순, 같은, 내림차순으로 나타난다
if str11.compare(str22) == .orderedAscending{
    print("오름차순")
}
str11.compare(str22,options: .caseInsensitive)//대소문자 구분없이 비교

//대소문자 변환
let uppercaseStr = str22.uppercased()
let lowercaseStr = str22.lowercased()

//문자열 내 위치 다루기
//var startIndex:String.Index // 유효한 범위는 아니니 주의할 것
//let index1 = str22.index(str22.startIndex,offsetBy:3)

//부분 문자열 ppt 87 이후로는 다음에 수업한 후 정리할 것





