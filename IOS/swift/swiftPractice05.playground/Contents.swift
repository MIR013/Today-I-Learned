//chapter 6. nil과 옵셔널
import Cocoa

/*
 nil: 값이 할당되지 않은 상태(유의미한 값이 세팅되지 않았다), 기본 타입에도 nil이 가능하다.(그러나 대입할 순 없다. 값이 무의미한 상태니까)
    값이 0: 의미있는 값 존재, 값이 nil: 값에 의미가 없음
 옵셔널(optional) 타입: nil과 일반 type을 다룰 수 있는 타입, 타입 뒤에 ?로 선언하며 타입선언이 필수이다.
    - nil 대입 가능
    - 초기화 안하면 자동으로 nil로 초기화 한다.
 */
var optionalVar: Optional<Int>
var optionalVar2: Int? = 3
optionalVar2 = nil
/*
 결과가 nil이 되는 행위 -> 나중에 처리해 줘야 한다
 1. 동작 결과가 nil이 가능한 경우
 2. 결과 타입이 옵셔널 타입일 경우
 3. 타입변환을 사용할 경우(타입변환을 못하는 경우)
 4. 딕셔너리를 참고할 경우(없는 key값을 참조)
 */
let intFromStr = Int("a")
let numbers:[String:Int]=["one":1,"two":2]
let three = numbers["three"]
//콜렉션과 옵셔널
var array1:[String]? // String 배열의 옵셔널: array1은 배열이거나 nil
var array2:[String?]=[nil] // String 옵셔널 타입의 배열: array2의 원소가 String이거나 nil
var dic1:[String:Int]? // 딕셔너리의 옵셔널: dic1은 딕셔너리거나 옵셔널
var dic2:[String:Int?]=["초기화 해야함..":nil] // 옵셔널 딕셔너리: 딕셔너리의 value가 Int이거나 nil


/*
 옵셔널의 사용
 - 객체나 데이터 다루기: 유요한 객체나 값에서는 정상동작, nil에서는 비정상 동작
 - 옵셔널 타입 사용: nil인 경우와 nil인 경우와 nil이 아닌 경우를 모두 고려 -> 안하면 컴파일 에러
 - 옵셔널 타입 자체는 유효값이 wraaped되어 있다. 그래서 진짜 값에 접근하고 싶으면 연산자 ?를 이용하여 unwrapping(유효한 값 얻어오기)하여 접근해야 한다.
 
 - 옵셔널 타입의 객체 사용
  1. nil 여부 비교 ex)if, guard
  2. optional binding ex) if,guard,??
  3. optional chain ex) ?
  4. forced unwrapping ex) !
 */
// 1. nil 검사하기
var optionalStr:String?
if optionalStr != nil{
    print("nil이 아니다")
}
else{
    print("nil이다")
}
//guard도 가능하나 함수나 반복문에 쓰여서... ppt 참고!

// 2. 옵셔널 바인딩: "유효한 값"을 상수에 대입(옵셔널 타입이 아니다)
/*
      1) 다중 바인딩, 함수호출(옵셔널 타입 반환하는) -> 여러 옵셔널 타입을 unwrapping하여 저장
      2) 옵셔널 바인딩 체인 -> 다중바인딩과 유사하며 바인딩 된 결과를 바인딩 한다.
      3) 옵셔널 바인딩과 조건비교 -> ,을 이용하여 조건문에 조건을 추가한다.
 */
optionalStr = "하이"
if let realStr=optionalStr{ //realStr은 String?이 아닌 String 타입이다.
    print("문자열의 값 \(realStr)")
}
else{
    print("문자열이 nil이다")
}
var userSelectedColor:String?
var colorName = userSelectedColor ?? "Red" // colorName에 userSelectedColor의 값이 nil이면 "Red"대입, 아니면 userSelectedColor값 대입

// 3. 옵셔널 체인(옵셔널의 unwrapping하여 값을 불러오는 것)
/*
 - 옵셔널 객체에 ? 연산자를 이용하여 직접 사용
 - 평가 결과가 nil이면 진행하지 않고, nil이면 반환
 - 평가 결과가 nil이 아니면 unwrapping
 - 최종 결과는 근데 옵셔널...
    cf) binding의 경우 결과는 옵셔널이 아닌 일반 타입, chain의 경우 결과는 옵셔널 (중요)
 - 메소드 호출, 프로퍼티 접근, 배열 원소 접근
 
 
 * ? 란
    1) 옵셔널 변수 선언: 타입 뒤에 ? 사용
    2) 옵셔널 체인: 옵셔널 값 불러오기, 옵셔널 변수 뒤 ?
    3) nil연산자: ??
 */
var opStr:String? = "ABC" //optional 변수 선언 - 1)
//결과가 nil이 아니면 값을 unwrapping하여 소문자로 변환한 후 값을 다시 wrapping하여 옵셔널으로 반환
//결과가 nil일 경우 중단, nil반환
let str = opStr?.lowercased() //optional chain - 2)
// 프로퍼티 접근, 메소드 호출, 배열.딕셔너리 접근
let arr : [String]? = ["A","B","C"]
let str23 = arr?[1].lowercased()

// 4. 강제 언래핑(forced unwrapping)
/*
 - ! 기호를 사용
 - nil여부와 관계없이 unwrapping시도
 - 타입 선언이나 옵셔널 체인에도 이용
 - nil이 아니면 unwrapping한 값 반환, nil이면 runtime error
 
 - 사용사례: 객체 생성, 메소드 호출, 프로퍼티 접근, 옵셔널 체인
 
 - 암시적 언래핑: 타입선언 뒤에 ! 사용하여 명시 없이 자동으로 언래핑을 시도하는 것
 */
let var1=Int("1") //binding한 결과라서 Int
let var2=Int("1")!
//let var3=Int("a")!

let iuoStr:String!="HELLO STR" //nil이면 rumtime error
iuoStr.lowercased()







