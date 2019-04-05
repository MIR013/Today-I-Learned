// chapter12. Struct&Enum
import Cocoa

//1. 구조체
/*
 객체 지향 프로그래밍: 클래스, 구조체, enum은 모두 메소드와 프로퍼티를 가진다
*/
struct Point{
    var x=0
    var y=0
    func description()->String{
        return "Point \(x) \(y)"
    }
}
var p1 = Point()
p1.x=10
p1.x
var p2 = Point(x:3,y:5)//구조체에서 초기화문을 사용하지 않으면 자동으로 생성해 준다.

struct Point1{
    var x:Int //클래스의 경우 init으로 초기화를 하던가 아니면 바로 값을 초기화 해야 한다.
    var y:Int
}
//var obj = Point1() //초기화가 안되어 있는 경우 initializer는 자동으로 생성이 안된다!!
var obj2=Point1(x:1,y:2)
    //구조체 초기화

struct Point2{
    var x:Int
    var y:Int
    init(){
        self.x=0
        self.y=0
    }
}
var obj3=Point2()
//var obj4=Point2(x:10,y:10) //initializer가 이미 정해져 있기 때문에 사용 x

struct myStruct{
    var value:Int
    
    init(v:Int){//designated initializer: 모든 프로퍼티를 초기화 한다
        self.value=v
    }
    
    init(){//conveninece initializer: 일부의 프로퍼티를 초기화
        self.init(v:0)//initializer delegation: designated initializer를 호출해 버린다.
    }
}
    //구조체의 프로퍼티 값 변경(수정) - 구조체 내부 메소드에서 사용할 때
struct Point3{
    var x=0
    var y=0
    mutating func moveTo(x:Int, y:Int){
        self.x=x //mutating이 없을 경우 값을 구조체 내 메소드에서 변경할 수 없다.
        self.y=y //class의 경우 내부 메소드에서 값을 바꿀 수 있다.
    }
}// struct Array - 클로저 개념이 있어서... 여튼 구조체 내 프로퍼티를 메소드에서 변경하려면 mutating을 써줘야 한다.
    //정적 메소드,프로퍼티
struct myStruct2{
    static func staticFunc(){
        print("정적 메소드")
    }
    static var staticProperty:Int! //옵셔널 타입은 초기화 안하면 nil로 자동 초기화 된다.
}//객체 생성 없이 가용 가능!
myStruct2.staticFunc()
myStruct2.staticProperty=10

//2. 클래스와 구조체
/*
            클래스     vs      구조체
    -----------------|--------------------
        프로퍼티, 메소드, 초기화를 한다.
    -------------------------------------
        상속과 재정의 o | 상속과 재정의 x
        ARC o       |  ARC x        ---> 메모리 관리시 조금 다름(11장에 존재)
    프로퍼티 반드시 초기화| 프로퍼티 초기화 굳이 필요 없음
        참조 복사(공유)|복사(값 같고 다른 객체가 됨)==밸류타입(대부분의 자료형)
                   |
                ... 등이 존재한다.
*/

//3. Enum
    //enum타입의 변수나 상수는 동시에 여러 값을 가질 수 없다.
enum Day{ //초기화시 값을 초기화 안하면 Int타입이라고 생각한다. 0부터 1씩 증가하는 값을 각각 가지게 된다.
    case am
    case pm,mm,yyyy,dd
}
var now:Day = Day.am //Day형의 변수를 선언, 초기화 안하면 에러나네
//이제 now에 Day의 am값을 부여한다 -> 값 하나밖에 못가짐, 없는 변수 이름을 넣으면 error
    //enum과 switch
switch now{
case .am:
    print("오전")//swift는 break없어도 밑으로쭉 안내려감!
case .pm:
    print("오후")
case .dd:
    print("dd")
case .mm:
    print("mm")
case .yyyy:
    print("yyyy") //switch의 경우 모든 경우에 대해서 나열해 줘야 한다 지금 Day의 경우 종 5개의 값이 있기에 모두 나여해 줘야 한다!!!!
}
    //만약 Int형이 아니라면 전부 명시해줘야한다! Int라면 암묵적으로 다 생략
enum Device:String{
    case phone="휴대폰",pad="패드"
}
    //프로퍼티와 메소드 (enum은 저장 프로퍼티를 사용할 수 없다)
enum Pet:Int{
    case cat,dog
    var name:String{ // 값을 저장하지 않고 부를때마다 계산해서 나간다
        switch self{
        case .cat:
            return "고양이"
        case .dog:
            return "강아지"
        }
    }
    func description()->String{
        return self.name //여기서 부르면 계산 프로퍼티가 실행된다.
    }
}
var raz = Pet.cat
raz.name //name 계산됨
raz.description()// name 계산됨
    //원소 타입이 있는 enum
var ael = Pet(rawValue: 0)//원소의 값(rawValue)가 0인 enum타입을 가져온다.-옵셔널 (얘가 특정 값을 내포하고 있을 것임 ex)cat)
//만약 해당하는 값을 가진 enum 타입이 없다면 nil을 반환한다
ael?.rawValue //옵셔널 타입이기 때문에 ?로 언래핑 해줘야 한다.

//4. 중첩타입
//타입 내부에 타입(구조체,class,enum)을 정의한다.
struct rectangle{ //내부에서만 사용할 수 있기 때문에 컨트롤하기 쉽다.
    struct Point{
        var x,y:Int
    }
    struct Size{
        var width,height:Int
    }
    var origin:Point
    var size:Size
    //초기화는 어떻게 해야 하는가
}
let p = rectangle.Point(x:10,y:10)
let s = rectangle.Size(width: 1, height: 1)































