// chapter8. Class
import Cocoa

//2. 클래스와 프로퍼티
/*
 프로퍼티 - 클래스 내의 변수를 뜻한다
 클래스 파일에 따로 정의 할 경우 탑 레벨에 실행 코드를 작성할 수 없다!!!
 main.swift에는 탑 레벨에 실행 코드를 작성할 수 있다.
*/
    //저장 프로퍼티 - 값을 저장하기 위한 용도, 객체 생성시 초기화해야한다.
class myClass{
    var intProperty=0
    var floatProperty:Float? //옵셔널의 경우 초기값을 입력 안하면 자동으로 nil이 들어감
    //var strProperty:String //초기화 해야한다 아니면 에러
}
var obj = myClass()
obj.intProperty=10
obj.floatProperty=3.1 //옵셔널 타입이 nil을 사용 할 수 있다지 값을 대입할때 언래핑하고 값넣고 다시 래핑할 필요는 없음 아마 지들이 알아서 하는 듯
let val = obj.floatProperty
type(of:val) //val은 옵셔널 타입
type(of:val!)
    //계산 프로퍼티 - 값을 저장하지 않음, 값을 얻거나 설정
                //읽고 쓰기가 모두 가능하면 set/get 모두 작성, 읽기만 하려면 get생략 가능, set전용은 없음
class person{
    //저장 프로퍼티
    let thisYear=2019
    var birthYear:Int=0
    // 계산 프로퍼티 -> 따로 저장 안하고 그때 그때 값에 따라 계산
    var age:Int{//type생략하면 안됨
        get{//외부에서 콜할때 나옴
            return thisYear-birthYear//반드시 return문으로 끝내기
        }
        set{ //들어오는 값을 newValue란 이름을 사용 할 거라면 (생략가능)
            //다른 이름을 사용할 거라면 set(otherName)으로 지정해 줘야 한다.
            birthYear=thisYear-newValue
        }
    }
}
var obj2=person()
obj2.age
obj2.birthYear=1995
obj2.age

//3. 메소드
class Counter{
    var count=0
    func increment(){
        count+=1
    }
    func increment(amount:Int){
        count+=amount
    }
    func increment(amt amount:Int,times:Int){
        count+=amount*times
    }
    func setCount(count:Int){
        self.count = count //프로퍼티 이름이 겹칠때 이를 구분하기 위한 객체 자신을 참조하는 self
    }
}
let counter = Counter() //객체 생성 후
counter.increment()
counter.count
counter.increment(amount: 5) //하나만 있으면 내부==외부 란 뜻
counter.count
counter.increment(amt: 3, times: 5) //외부파라미터 이름 사용
counter.count

//4. 타입 메소드, 타입 프로퍼티
    //인스턴스 메소드 - 객체를 생성하여 사용,인스턴스 멤버(메소드,프로퍼티) 접근 가능, 타입멤버는 접근 불가
                    // 원래 자바나 씨쁠쁠은 타입멤버 접근가능한디.. 여긴 안됨
    //타입 메소드 - 객체 생성 안함, 인스턴스 멤버 접근 불가, 타입 멤버 접근 가능, static
class fourClass{
    var property=0
    static var staticProperty = 0
    
    static func typeMethod(){
        //property=2 //static method에서 인스턴스 변수 사용 불가
        staticProperty=2
        print("type method work")
    }
    
    func instanceMethod(){
        property=1
        //staticProperty=1 //인스턴스 메소드에서 타입 변수 사용 불가
        print("instance method work")
    }
}
var obj3 = fourClass()
obj3.instanceMethod()
//obj3.typeMethod()//이렇게는 타입 메소드를 부를 수 없다.
fourClass.typeMethod()
//fourClass.instanceMethod() //객체 생성 없이 인스턴스를 부를 수는 없다

    //타입 프로퍼티 - 저장,계산 프로퍼티 가능, 객체 생성 없이 사용
class rectangle{
    var width:Int=0
    static var name:String{
        return "사각형"
    }
    static var edge=4
}
var obj4 = rectangle()
obj4.width = 10
//obj4.name //인스턴스 타입에는 타입 프로퍼티 사용 불가!
rectangle.edge=3 //그냥 객 체 전체적으로 바꾸려고 할때 사용한다.
rectangle.edge
rectangle.name

    //프로퍼티 변경 감시
/*
     프로퍼티 변경 전(호출 전에 처리): willSet
     프로퍼티 변경 후(호출 후에 처리): didSet
     단, initializer의 초기화때는 동작하지 않는다.
*/
class square{
    var height:Int=0{ //저장 프로퍼티
        willSet{ //여기도 newValue 이름 그대로 사용할 거면 생략 가능 아니면 생략 불가
            print("사각형 높이 변경 예정: \(newValue)")
        }
        didSet{// oldValue 이름 그대로 사용할 거면 생략 가능 아니면 생략 불가
            print("사각형 높이 변경 완료. 이전값: \(oldValue)")
        }
    }
}
var obj5 = square()
obj5.height=100 //값 병경시 willSet,didSet이 바로 불린다.

    // 프로퍼티 늦은 초기화 - 저장 프로퍼티는 반드시 초기화를 해야 하는데 경우에 따라 못할 경우가 생긴다.(예를 들어 나중에 불리는 객체가 생성 될때, 이걸 미리 초기화 하면 메모리에 좋지 않음) 그래서 나중에사용할대 초기화를 한다.
class people{
    lazy var phone = Phone() //lazy를 이용하여 늦은 초기화 명시(메모리를 최대한 효율적으로 사용하기 위함)
}
class Phone{
    var number:String
    init(){
        print("phone 객체 생성")
        number="010-123-123" //여기서 초기화 해줘도 됨 어차피 객체 생성 될 때, init부터 불리니까
    }
}
let obj7 = people() //아직 Phone이 불려서 초기화 되지 않음
obj7.phone //이 lazy 변수를 사용 할 때, 초기화가 진행 된다.
























