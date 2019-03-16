// 04. 다수의 데이터 다루기
import Cocoa

//1. 튜플
// 튜플안의 데이터는 타입이 달라도 상관없다.
var tuple1 = (1,1.2,"one") //변수나 상수로 사용가능
tuple1.2 //.index로 값 불러오기
let (num,_,_) = tuple1 //_의 경우 어떤 값이 들어오든 상관하지 않겠다는 뜻이다.
num

//각 원소에 이름을 설정하여 이름으로 접근할 수도 있으나 없는 이름의 경우 에러가 뜬다
let tuple2 = (num:2,eng:"two",kor:"둘")
tuple2.num
//tuple2.aaa

//튜플 간 비교
(1,"1") == (1,"1")
(1,"one")<(2,"two")

//--------------------------------------------------------
//배열, 딕셔너리, 셋의 경우 일종의 콜렉션 타입이다. 튜플은 같이 쓰일 뿐 콜렉션 타입은 아니다.
//콜렉션 타입은 값의 타입이 반드시 같아야 한다
//2. 배열
//배열생성
var intArray:[Int] = [1,2,3,4,5]
let floatArray = Array<Float>([1.1,2.2,3.3])
var emptyArray1 = [Int]() //공백 배열의 경우 초기값을 안줌
let empryArray2:[String]=[] //타입을 선언해 준다면 보통[]같이 명시해 줘야 한다.

//원소접근
intArray.count //원소개수
intArray.isEmpty //공백확인
let element1 = intArray[1] //index범위 주의할 것

//원소 추가
intArray.append(6)
intArray.insert(9, at: 2) //특정 위치에 넣기
intArray += [11,12,13] //아예 배열로 줄 수도 있다

//원소 삭제
intArray.remove(at: 3)//특정위치 삭제
intArray.removeFirst() //삭제된 값은 반환
intArray.removeLast()
intArray

//원소 변경
intArray[2]=999
intArray[4...5]=[1,1,1,1]
intArray

//밸류타입!!! -> 대입시 값 전체가 복사된다. 자바처럼 배열객체(주소)가 카피되는 것은 아니다.
var intArray2 = intArray
intArray2.removeLast(2)

//배열간 비교
intArray2 == intArray


//3. 딕셔너리
//배열과 가장 큰 차이점은 배열은 인덱스를 자동으로 생성해주나 딕셔너리의 경우 프로그래머가 직접 key값을 지정해 주어야 한다.
//딕셔너리 생성
var dic1 = ["1":"January","2":"Febuary","3":"March"] //타입추론
var dic2 : [String:Int] = ["일":1,"이":2,"삼":3] //[key:value]순으로 타입을 지정할 수 있다.
var emptydic = [Int:Int]() //빈 객체 생성

//원소 접근
dic1.count
dic1["2"]//key값으로 접근 가능
dic1["4"]//key값이 없는 것이라면 nil반환

//원소변경
dic1["4"]="april"
dic1["2"]="2월"
dic1.removeValue(forKey: "1")
dic1["3"]=nil
dic1

//밸류타입이기에 새 변수 대입시 복사, 비교도 가능(1:1비교)
let newDic = dic1
dic1==newDic

//key값이 Int일 경우 배열과 비슷해 진다.

//콜렉션을 이용한 다중구조
var twoDimensionArray:[[String]] = [["a","b"],["c"],["d","e","f"]]
twoDimensionArray[1][0]
//딕셔너리와 배열을 혼합해서 사용가능
let evenNum = [2,4,6]
let oddNum = [1,3,5,7]
let dic:[String:[Int]] = ["even":evenNum,"odd":oddNum]
dic["odd"]![1] //옵셔녈과 관계있어 !를 이용하여 참조한다.
//딕셔너리 배열도 되고 다양함


//4. 셋
//유일한 원소, 원소만 저장, 임의의 순서(!=입력한 순서)
//배열에서 생성
var beverage:Set<String>=["coke","juice","milk"]
var letters = Set<Character>() //공백의 셋 생성

//원소접근
beverage.count
beverage.isEmpty
beverage.contains("coke") //해당 원소를 포함하고 있는지 알 수 있다.
beverage.contains("melon")

let index = beverage.startIndex //index이용하기
beverage[index]
let index2 = beverage.index(after:beverage.startIndex) // 다음 index로 넘어간다
beverage[index2]

beverage.first//첫번째 원소접근
let beverageArray = Array(beverage) //배열 객체 생성 후 접근
beverageArray[1]

//원소수정
beverage.insert("soda") //추가
beverage.remove("coke") //삭제
beverage

//set 연산
var set1:Set<Int>=[1,2,3]
var set2:Set<Int>=[2,3,4]
set1.intersection(set2) //교집합
set1.union(set2) //합집합 -> 순서는 다를 수 있음
set1.symmetricDifference(set2) //대칭차집합
set1.subtracting(set2) //차집합


