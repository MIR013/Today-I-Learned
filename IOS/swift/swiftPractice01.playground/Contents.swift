// 2. 데이터타입과 연산자
import Cocoa

// print 사용법
var str = "Hello my name is"
var name="cha su jin"
print(">>",str,"\(name)")

// 변수를 선언하는 방법
var i=1 //값을 보고 타입을 추론한다.
var f:Float=1.1//혹은 직접 타입을 명시해 주기도 한다.
print("i is \(i) and f is \(f)")

// 타입에러
var var1 = 10
//var1 = 3.14 // int형 변수에 double값을 넣을 수 없다.
var var2 = 3.14
//var ret = var1+var2 //혼용하여 사용할 수 없다.

// 상수 선언
let constant = 123 //타입추론
//constant = 456 //상수는 당연히 값을 변경할 수 없다

//변수와 상수는 초기화 전에 사용하면 당연히 에러가 난다
//var i1 : Int //단 초기화를 바로 하지 않을 거면. 변수나 상수의 타입을 반드시 명시해 주어야 한다. -> xcode10버전의 문제로 수행이 안됨
//i1+10

//산술연산자 중 증감, 단항 연산자는 사용불가
var i2 = 0
//i2++
i2+=1

//산술 이항 연산자에서 반드시 연산자 사이에 공백을 둘다 넣거나 둘다 넣지않고 붙여써야 한다
//그렇지 않으면 연산자를 부호연산자인 단한연산자로 인식하기 때문이다
//자주일어나는 실수임!!
1+2
//1 +2
1+2

//삼항연산자
var isTrue:Bool=true
var value = isTrue ? 10 : 20
print(value)

//타입의 입력범위를 벗어나면 에러
//var intVal1:Int8 = 128

//타입변환
var int8Val:Int8=127
var int16Val:Int16=111
Int16(int8Val)+int16Val

var i3 = Int(truncating: true)
let str1="5"
var i4 = Int(str1) //문자도 해당 정수로 변환 가능
let str2="hello"
var i5=Int(str2) //하지만 변환이 안되는 것도 존재

//랜덤함수 - 반환값이 UInt32이기에 값으 ㄹ저장하려면 맞추어줘야 한다.
var r1: Int = Int(arc4random_uniform(10))
var r2: UInt32 = arc4random_uniform(10)

//실수타입
var doubleVar = 3.14
var floatVar:Float=36.5 // float를 초기화 할때는 double값을 넣어주어도 타입변환을 허용한다.
//doubleVar + floatVar //물론 더하는 것은 안된다.

//타입정보 알기
let i6 = 100
type(of:i6) //of란 이름의 파라미터에 i6를 넘겨준다
type(of: i6) == Int.self //이렇게 타입을 찾을 수도 있다.







