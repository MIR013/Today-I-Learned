// chapter7. function
import Cocoa

//1. 함수의 정의
func greeting(){ //반환값이 없는 void의 경우는 생략할 수 있다.
    print("hello swift")
}
greeting()

func areYouOk() -> Bool{
    return true; //반환값과 같은 타입을 반환한다. 반환값 설정 시 반드시 return해줘야 한다
}
areYouOk()

func random3()->(Int,Int,Int){ //튜플 등 다수의 값을 반환할 수 있다.
    let r1 = Int(arc4random()%10)
    let r2 = Int(arc4random()%10)
    let r3 = Int(arc4random()%10)
    
    return(r1,r2,r3)
}
random3()

//2. 함수 파라미터
func greeting2(person: String){ //외부 파라미터 설정안하면 내부=외부 동일하게 사용
    print("hello \(person)")
}
greeting2(person:"chacha")

func greeting3(who person :String){ //외부의 파라미터 호출 이름, 내부에서 사용될 파라미터 이름
    print("hello \(person)")
}
greeting3(who: "chasujin")

func greeting4(_ person: String){ //외부의 파라미터 호출 이름을 _로 주면 이름생략으로 호출 시 그냥 값만 줘도 된다.
    print("hello \(person)")
}
greeting4("sujin")

func greeting5(person:String,_ emotion:String){
    print("hello \(person) with ",emotion)
}
greeting5(person: "meme", "passion")
//greeting5("passion",person: "meme") //파라미터 순서는 함수와 똑같이 맞춰 줘야 한다.

    //오버로딩 - 이름이 같은 함수를 사용. 보통 파라미터가 다르다
func sayHello(msg:String){
    print("say hello \(msg)")
}
func sayHello(_ msg:String){ //다른 외부 파라미터 이름
    print("say hello \(msg)")
}
func sayHello(_ times:Int){ // 다르느 파라미터 타입
    print("say hello \(times)")
}
sayHello(msg:"1st")
sayHello("2nd")
sayHello(3)

func greeting6(person:String="friend"){ //파라미터 값을 초기화 해 두면 부를때 생략할 수 있다.
    print("hello \(person)")
}
greeting6()
//주의할 점은 오버로딩 되었을 때, 부르는 방법이 같게 되면 혼동이 일어난다 -> 맨 처음 정의 됨 함수가 불러진다.
func greeting7(whom person:String){
     print("hello \(person)")
}
func greeting7(whom person:String, emotion:String="happy"){
    print("hello \(person) ","with"+emotion)
}
greeting7(whom: "chacha")//맨 위으 greeting7이 불린다.

    //가변길이 파라미터
func addAll(_ values:Int ...){ //이 값음 함수 내부에서 배열 처럼 사용한다.
    print(values.count)
    for v in values {
        print(v)
    }
}
addAll(1,2,3)
addAll(1,3,5,7,9)

    //inout파라미터 -> 파라미터는 함수 내부에서 상수로 사용한다. ㅜ그래서 변경 시 에러가 나는데 inout으로 값을 바꿀 수 있게 해준다
func swapTowvalue(_ arg1: inout Int,_ arg2: inout Int){
    let temp = arg1//상수는 선언 시 초기화할때 한번만 값 저장 가능
    arg1 = arg2
    arg2 = temp
}
var value1 = 1
var value2 = 2
swapTowvalue(&value1, &value2)//주소로 전달 해 줄 경우 값이 바뀐다! -> 따로 저장해서 바꿔줄 필요 없음
print(value1," ",value2) // print할때, +로 연결하는건 같은 타입만... 진짜 더하는 거였네, 왠만하면 ','로 연결하자

//3. 함수와 옵셔널 - nil을 사용하여면 타입을 옵셔널로 줘야한다
    //반환타입이 옵셔널
func nilReturnFunction()->Int?{
    return 1;//nil 가능
}
let ret = nilReturnFunction() //함수의 반환형이 Int?이르모 옵셔널이다.
type(of:ret)
if let ret1 = nilReturnFunction(){ //옵셔널 바인딩을 사용했기 때문에 Int이다.
    print("실행결과: \(ret1)")
    type(of : ret1 )
}
    //함수 파라미터가 옵셔널 - 함수 구현시 nil검사가 필요하다
func append(str:String,num val:Int?)->String{
    guard let str2=val else{ //str2는 옵셔널 바인딩을 사용하였으므로 타입은 Int이다.
        return str
    }
    return str+String(str2)
}
append(str: "welcome", num: nil)//1

let ter:Int = nilReturnFunction()! //강제 언래핑 - nil이면 당연 에러남

    //함수 내부에 함수를 정의할 수 있다. 단, 그 함수 내에서만 함수를 사용 가능하다
func outerFunc(){
    func innerFunc(){
        print("inner")
    }
    print("outer")
    innerFunc()
}
outerFunc()
//innerFunc() //외부에서 호출 불가능! outer안에써만 쓰이고 끝난다
















