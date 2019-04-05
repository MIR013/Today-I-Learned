// chapter13. protocol, extension
import Cocoa

//1. 프로토콜
/*
    프로토콜은 java의 interface와 비슷한 개념이다.
    cf) class와 interface의 차이점은 method의 구현 여부이다.
        추상 class란 하나이상의 method의 body가 구현이 되지 않은 것이고
        interface는 상수, method등이 모두 추상 method이다.
    프로토콜은 구형이 없어서 단독으로 사용이 불가능하고, 클래스,구조체,enum과 함꼐 사용하며 일종의 구현약속이다.
*/
    // 프로토콜 정의와 채택(클래스,구조체,enum이 프로토콜을 상속(?)받아 구현하는 것
protocol Singing{
    func sing()//구현하면 안됨
}
class Bird:Singing{
    func sing() { //일종의 오버라이딩이라고 볼 수 있다.(원 래 있는 것을 수정해서 사용)
        print("짹짹짹") //채택해놓고 구현 안하면 에러뜬다
    }
}
var sparrow=Bird()
sparrow.sing()

    //다중 프로토콜 채택
protocol Dancing{
    func dance()
}
class Human:Dancing,Singing{
    func sing() {
        print("라라라")
    }
    func dance() {
        print("춤춤춤")
    }
}
    //프로토콜 내 타입 메소드 선언
protocol Specied{
    static func specied()->String
}
    //프로토콜 상속과 구현
protocol Entertaining: Singing,Dancing{//프로토콜이 두 프로토콜을 상속받음
}
struct Human1:Entertaining{
    func sing() {
        print("human1 sing")
    }
    func dance() {
        print("human1 dance")
    }
}
    //프로토콜 내 프로퍼티 선언 - get/set 행위만 선언해두고, 구현시 저장으로 할지 계산으로 할 지 결정한다.
protocol HoldingBreath{
    var duration:Int{ get set } //get,set같이 ,로 연결하면 에러
}
class myClass:HoldingBreath{
    var duration: Int{ //계산 프로퍼티로 선언
        get{
            return 0
        }
        set{
            self.duration=newValue
        }
    }
}

struct myStruct:HoldingBreath{
    var duration: Int //저장공간이 존재하는 저장 프로퍼티로 선언
}
    //프로토콜 내 initializer 선언 가능
protocol named{
    init(name:String) //나중에 이 형태로 초기화 하는 항목을 만들어 줘야 한다.
}
class Monster:named{
    var name:String //타입선언 해야하며, 아래서 쓰려면 여기서 정의해줘야 값을 변수에 넣던가 말던가 한다.
    required init(name: String) { //프로프티에서 약속한 init의 경우 클레스에서 구현시 required필요
        self.name=name
    }//conveninece에도 required가 필요
}
struct Boss:named{
    init(name: String) {//구조체의 경우 required는 필요 없다.
    }
}
    //프로토콜을 변수/상수의 타입으로 사용
var singingAnimal:Singing=Human() //Singing(프로토콜)타입의 변수 singingAnimal을 Singing을 채택한 Human class로 초기화 한다.
singingAnimal.sing()//Singing에서 초기화 한 것만 사용 가능, Human이 Dancing도 채택했는데 여기의 dance도 구현했을 것이지만 이를 singingAnimal은 사용할 수 없다.
//var dancingBird:Dancing=Bird()//Dancing 프로토콜을 채택하지 않은 클래스로 초기화 할 수 없다.
func entertain(who: Singing&Dancing){//Singing과 Dancing 프로토콜을 동시에 채택한 파라미터만 사용 가능
}
var h = Human()
entertain(who: h)//Human이란 클래스는 둘 다 채택했기에 이와 관련 된 변수를 넣어줄 수 있다.
    //클래스 전용 프로토콜
protocol myProtocol:class{
}
//struct myStruct1:myProtocol {} // class전용으로 두었기에 구조체에서 사용 불가


//2. extension
/*
 extension: 타입을 나눠서 작성, 하나의 타입으로 동작, 기존에 작성된 타입을 확장, 서로 다른 파일에 작성 가능
 extension으로 불가능 한 것: designated initializer, 저장 프로퍼티(만약 가능하다면 designated initializer가 초기화를 다 못하는 상황이 발생)-> designated initializer에 영향을 주면 확장 불가.
 extension으로 가능한 것: 위에 것 제외한 나머지
*/
class Dog{
    func eat(){print("밥먹기")}
}
extension Dog{//Dog 클래스를 타입을 나눠서 작성!! eat메소드는 그대로 남아있다
    func bike(){print("멍멍멍")}
}
var myDog=Dog()
myDog.eat()
myDog.bike()

    //프로퍼티-계산은 가능, 저장은 불가
extension Dog{
    var averageLife:Int!{return 15}//get만 있을 경우 생략 가능
}
    //initializer의 경우 designated는 불가 convinience는 가능
extension Dog{
    convenience init(name: String){
        self.init() // 얘 안부르면 에러...
    }
}
    //프로토콜 채택 및 구현
protocol running{
    func run()
}
extension Dog:running{ //이제 Dog가 runnuing을 채택하게 하는 듯
    func run(){
        print("뛰기")
    }
}

//3. 프로토콜 extension
    //프로토콜 extension에 구현코드 작성 가능
protocol Movable{} //프로토콜 선언
extension Movable{ //이 프로토콜을 확장, 위는 클래스를 확장하는데 프로토콜을 채택하게 만든 것
    func move(){//프로토콜을 확장하면 아무리 프로토콜이라도 body부분을 구현할 후 있다.
        print("gogogo")
    }
}
struct Human123:Movable{} //이제 move는 구현할 필요 없다 extesion으로 구현해 뒀기 때문 + 프로토콜 타입 변수
var man=Human123() //man에 Movable 프로토콜을 채택한 Human으로 초기화
man.move()

    //다중 프로토콜 채택 - 다중 상속 효과
class superman:Movable,Dancing,Singing{
    func move() {
        print("over riding")
    }
    func dance() {    }
    func sing() {    }
}
var a = superman()
a.move()
a.dance()
    //상속이 없는 구조체에 코드 중복 발생 -> extension으로 프로토콜 생성 후 메소드를 만들고, 이 프로토콜을 구조체가 채택하면 내부에서 더 구현할 필요가 없다.
//-----------
struct Birds{
    func move(){print("이동하다")}
    func fly(){print("날다")}
}
struct Airplane{
    func move(){print("이동하다")}
    func fly(){print("날다")}
}
//-----------를 아래와 같이 중복 코드를 해소시킨다.
protocol Moveee{}
extension Moveee{
    func move(){print("이동하다")}
}
protocol Flyeee {}
extension Flyeee{
    func fly(){print("날다")}
}
struct Birds1:Moveee,Flyeee{}
struct Airplane1:Moveee,Flyeee{}


