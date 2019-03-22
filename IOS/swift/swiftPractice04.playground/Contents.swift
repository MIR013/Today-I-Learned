//chapter 5. 제어문
import Cocoa

// 1. 반복문

//for문의 경우 c의 스타일 대신 for..in문을 사용한다.
for i in 0..<5{
    print("for 반복문 \(i)")
}
for item in [1,2,3,5,6]{ // array, set
    print(item)
}
var dic1: [String:Int] = ["coke":1,"cake":2,"sprite":3]
for (key,value) in dic1{ //dictionary
    print("key: \(key), val: \(value)")
}
let str1 : String = "내 이름은 차수진"
for char in str1 { //string collection
    print(char)
}

//while문
var i :Int = 0;
while i<5{
    i+=1
}
repeat{
    print("i: \(i)")
    i+=1
}while i<10


// 2. 제어문
//조건문의 괄호는 생략이 가능하나 바디의 중괄호는 생략할 수 없다.
//조건문의 결과는 반드시 Bool형태일 것!
//nil 비교시 != or == nil을 붙일 것
var bloodType = "C"
if bloodType=="A"{
    print("혈액형은 A")
}
else if bloodType=="B" || bloodType=="O"{
    print("혈액형은 B나 O형")
}
else{
    print("그러면 AB형?")
}
//if-let 바인딩 -> 옵셔널에서 자세히 한다
if #available(iOS 10, *){
    print("이거슨 ios 10입니다.")
}
else{
    print("이거슨 ios 10이 아닙니다.")
}
//early exit -> 실행 전 미리 조건을 검사하고 맞지 않으면 exit
/*
guard i > 10 else{
    print("여기에는 보통 진행조건이 옵니다")
    return //return or break
}
print("guard-> 진행가능")
if i<=10 {
    print("여기에는 보통 종료조건이 옵니다")
}
 */
//switch -> 조건에 맞는 case만 실행한다(break 불필요)
var sweet = 3
switch sweet{
case 1:
    print("1")
case 3:
    print("3")
    fallthrough
case 4:
    print("4")
default:
    print("case는 모든상황에서 작성해야 한다. 즉 모든 정수에 대해서 case를 정해야 한다. 하지만 불가능하니 break를 사용한다.")
}
var tupleVal = (1,"one")
switch tupleVal{ //튜플도 적용가능하다
case(0,"zero"):
    print("한줄 꼭 써야한다. 예제가 틀림")
case(0,"영"):
    print("0,영")
case(1,_):
    print("앞의 값이 1이기만 하면 뒤의 값은 상관 없다 무엇이든")
default:
    print("others")
}
// value binding(== 값이 들어간다. 대입)
var point=(2,2)
switch point {
case (1,let y): //x가 1이면 y에 해당 튜플의 값을 넣는다
    print("1, \(y)")
case (let x,2): //y가 2이면 x에 해당 튜플의 값을 넣는다
    print("\(x) 2")
case let(x,y) where x<0 && y>0: // 값이 뭐든간에 각각 x,y에 바인딩 된다. + where절의 조건에 맞아야 한다.
    print("\(x) \(y)") //이미 한 case돌면 다른 case는 안도는 듯
default: //절대 안돌면 warning으로 알려줌. 케이스가 덜 나열되어 있으면 경고창이 뜬다(컴파일 에러)
    print("eeeerrr")
}



