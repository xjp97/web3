// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// 你好世界
contract HelloWorld {
    string public greet = 'Hello world!';
}

// 第一个 智能合约
contract FirstApp {
    uint256 count;

    function getCount() public view returns(uint256) {
        return count;
    }
    function  incCount() public  {
        count +=1;
    }
    function  decCount() public  {
        require(count > 0,"count cannot be negative");
        count -= 1;
    }
}

// 数据类型
contract Primitves {
    bool public boo = true;

    // uint 非负整数 每种类型不同的取值范围
    uint8 public u8 = 1;
    uint256 public  u256 = 456;
    uint256 public  u = 123;

    // 有符号整数， 可以为负数
    int8 i8 = -1;
    int256 i256 = 256;
    int256 i = -123;

    // int256 最大最小值
    int256 public minInt = type(int256).min;
    int256 public maxInt = type(int256).max;

    address public  addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
    
    // 字节序列， 字节数组的缩写
    bytes1 a = 0xb5;
    bytes1 b = 0x56;

    // 未分配的变量都有一个默认值
    bool public defaultBoo; // false
    uint256 public defaultUint; // 0
    int256 public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000


}

// 变量
contract Variables {
    // 状态变量存储在区块链上
    string public str = 'storedVariables';
    uint public  num = 123;

    function doSomethint() public view  {
        // 本地变量
        uint256 i = 456;
        // 全局变量
        uint256 timestamp = block.timestamp;
        address sender = msg.sender;
    }
}

// 常量
contract Constants {
    address public  constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint256 public  constant MY_UINT = 123;
}

contract Immutable {
    // 不可变常量
    address public  immutable MY_ADDRESS;
    uint256 public  immutable MY_UINT;

    constructor(uint256 _myUint){
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}

// 读取和写入状态变量
contract SimpleStorage {
    uint public  num;
    function setNum(uint _num) public  {
        num = _num;
    }
    function getNum() public view returns(uint) {
        return num;
    }
}

// ether and wei
contract EtherUnits {
    uint public  oneWei = 1 wei;
    bool isOnewei = (oneWei == 1);

    uint public oneGwei = 1 gwei;
    bool public isOneGwei = (oneGwei == 1e9);

    uint public oneEther = 1 ether;
    bool public isOneEther = (oneEther == 1e18);
}

// gas
contract Gas {
    uint i = 0;
    function forever() public  {
        while (true){
            i +=1;
        }
    }
}


// if else
contract IfElse {
    
    function foo(uint256 x) public pure returns(uint256) {
        if(x < 10 ){
            return 0;
        }else if (x< 20){
            return 1;
        }else {
            return 2;
        }
    }

    function ternary(uint256 _x) public pure returns (uint256) {
        return _x <10 ? 1:2;
    }
}

// For 和 While 循环
contract Loop {
    function loop() public  {
        for (uint256 i = 0; i < 10; i++) 
        {
            if (1 == 3){
                continue;
            }
            if (i == 5){
                break;
            }
        }
        uint256 j;
        while (j<10){
            j++;
        }
    }
}

// 映射
contract Mapping {
    mapping(address => uint256) public myMap;

    function get(address _addr) public view returns (uint256) {
        return myMap[_addr];
    }
    function set(address _addr,uint256 _i) public{
        myMap[_addr] = _i;
    }
    function rmove(address _addr) public  {
        delete myMap[_addr];
    }
}

contract NestedMapping {
    mapping(address => mapping(uint256 => bool)) public nested;

    function get(address _addr,uint256 _i) public view returns (bool) {
        return nested[_addr][_i];
    }

    function set(address _addr , uint256 _i , bool _boo) public  {
        nested[_addr][_i] = _boo;
    }

    function rmove(address _addr,uint256 _i) public {
        delete nested[_addr][_i];
    }
}

contract Array {
    
    uint256[] public arr;

    uint256[] public arr2 = [1,2,3];
    // 固定大小的数组
    uint256[10] public myFixedSizeArr;

    function get(uint256 i ) public  view returns (uint256) {
        return arr[i];
    }

    function getArr() public view returns (uint256[] memory) {
        return arr;
    }

    function push(uint256 i) public  {
        // 增加数组元素
        arr.push(i);
    }

    function pop() public  {
        // 删除数组的最后一个元素
        arr.pop();
    }

    function remove(uint256 index)public  {
        // 删除数组元素，不会改变数组长度， 之后将该位置的值重置为0
        delete arr[index];
    }

    function examples() external  {
        // 在内存中创建数组，只能创建固定大小的
        uint256[] memory a = new uint256[](5);
    }

}

// 删除数组元素
contract ArrayRemoveByShifting {
    uint256[] public  arr;

    function remove(uint256 _index) public {
        require(_index < arr.length, "index out of bound");

        for (uint256 i = _index; i < arr.length -1; i++) 
        {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function test() external  {
        arr = [1,2,3,4,5];
        remove(2);
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 3);
        assert(arr[3] == 5);
        assert(arr.length == 4);
    }
}


// 枚举
contract Enum {
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
    // 默认值为枚举中第一个元素
    Status public status;

    function get() public view returns (Status) {
        return status;
    }

    function set(Status _status) public  {
        status = _status;
    }

    function cancel() public  {
        status = Status.Canceled;
    }

    function reset() public  {
        delete status;
    }




}


// 结构体

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }
    Todo[] public todos;

    function create(string calldata _text) public  {
        todos.push(Todo(_text,false));
        todos.push(Todo({text: _text, completed: false}));


        Todo memory todo;
        todo.text = _text;

        todos.push(todo);
    }

    function get(uint256 _index) public view returns 
    (string memory text,bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text,todo.completed);
    }

    function updateText(uint256 _index,string calldata _text)
    public  {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function toggleCompleted(uint256 _index) public  {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}

contract DataLocations {
    uint256[] public  arr;
    mapping(uint256 => address) map;
    struct MyStruct{
        uint256 foo;
    }

    mapping(uint256 => MyStruct) myStruct;

    function f() public  {
        _f(arr,map,myStruct[1]);
        MyStruct storage _myStruct = myStruct[1];
        MyStruct memory myMem = MyStruct(0); 
    }

    function _f(
        uint256[] storage _arr,
        mapping(uint256 => address) storage _map,
        MyStruct storage _myStruct
    ) internal {}

    function g(uint256[] memory _arr) public returns (uint256[] memory) {
         
    }

    function h(uint256[] calldata _arr) external  {
        
    }
}

// 临时存储
// storage 存储在区块链上
// memory 存储在内存中， 函数结束清除
// Transient storage 交易结束清除

interface  ITest {
    function  val() external view returns (uint256);
    function test() external ; 
}


contract Callback{

    uint256 public val;

    fallback() external {
        val = ITest(msg.sender).val();
    }

    function test(address target) external  {
        ITest(target).test();
    }



}

contract TestStoage {
    uint256 public  val;
    function test() public  {
        val = 123;
        bytes memory b = "";
        msg.sender.call(b);
    }
}

contract TestTransientStorage {
    bytes32 constant SLOT = 0;

    function test() public {
        assembly {
            //tstore(SLOT, 321)
        }
        bytes memory b = "";
        msg.sender.call(b);
    }

    function val() public view returns (uint256 v) {
        assembly{
           // v := tload(SLOT)
        }
    }

}

contract ReentrancyGuard {
    bool private locked;
    modifier lock() {
        require(!locked);
        locked = true;
        _;
        locked = false;
    }
    function test() public  lock {
        bytes memory b = "";
        msg.sender.call(b);
    }
}

contract ReentrancyGuardTransient {
    bytes32 constant SLOT = 0;

    modifier lock() {
        assembly {
          //  if tload(SLOT) { revert(0, 0) }
          //  tstore(SLOT, 1)
        }
        _;
        assembly {
          //  tstore(SLOT, 0)
        }
    }

    function test() external lock {
        // Ignore call error
        bytes memory b = "";
        msg.sender.call(b);
    }
}

contract Function {
    function  returnMany() public pure  returns (
        uint256,bool,uint256
    ) {
        return (1,true,2);
    }

    function named() public  pure returns (
        uint256 x,bool b,uint256 y
    ) {
        return (1,true,2);
    }

    function assigned() public  pure returns (
        uint256 x,bool b,uint256 y
    ) {
       x = 1;
       b = true;
       y = 2;
    }

    function destructuringAssignments() public  pure returns (
        uint256,bool,uint256,uint256,uint256
    ){
        (uint256 i,bool b,uint256 j) = returnMany();
        (uint256 x,,uint256 y) = (4,5,6);
        return (i,b,j,x,y);
    }

    // map 不能用于输入输出
    // 数组可以用于输入输出
    function arrayInpu(uint256[] memory _arr) public  {
        
    }
    uint256[] public  arr;
    function  arrayOutput() public view returns (uint256[] memory) {
        return arr;
    }

}

contract XYZ {

    function someFuncWithManyInputs(
        uint256 x,
        uint256 y,
        uint256 z,
        address a,
        bool b,
        string memory c
    ) public  pure  returns (uint256){
        
    }

    function callFunc() external pure returns (uint256) {
        return someFuncWithManyInputs(1,2,3,address(0),true,"c");
    }

    function callFuncWithKeyValue() external pure returns (uint256) {
        return someFuncWithManyInputs(
            {
                a: address(0),
                b: true,
                c: "c",
                x: 1,
                y: 2,
                z: 3
            }
        );
    }
}

// 视图和纯函数
contract ViewAndPure {

    uint256 public x = 1;

    function add(uint256 y) public view returns (uint256){
        return x +y;
    }
    
    function addPure(uint256 i,uint256 j) public pure returns (uint256) {
        return i +j;
    }
}

contract Error {
    function testRequire(uint256 i) public pure  {
        require(i > 10, "Input must be greater than 10");
    }

    function testRevert(uint256 i) public  pure  {
        if (i > 10){
            revert("Input must be greater than 10");
        }
    }

    uint256 public num;

    function testAssert() public view  {
        assert(num ==0);
    }

    error InsufficientBalance(uint256 balance,uint256 withdrawAmount);

    function testCustomError(uint256 _withdrawAmount) public view  {
        uint256 bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({
                balance: bal,
                withdrawAmount:_withdrawAmount
            });
        }
    }
}

contract FunctionModifier {
    
    address public owner;
    uint256 public  x = 10;
    bool public locked;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Not owner");
        // 一个函数修饰符，告诉solidity 执行剩余代码
        _;
    }

    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner){
        owner = _newOwner;
    }

    modifier noReentrancy(){
        require(!locked, "No reentrancy");
        locked = true;
        _;
        locked = false;
    }


    function decrement(uint256 i) public noReentrancy{
        x -= i;
        if(i > 1){
            decrement(i -1);
        }
    }





}

// 事件
contract Events {
    event Log(address indexed sender, string message);

    event AnotherLog();

    function testEvent() public  {
        emit Log(msg.sender,'hello world');
        emit AnotherLog();
    }
}


//构造函数
contract  X {
    string public name;

    constructor(string memory _name){
        name = _name;
    }
}

contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}


contract B is X("Input to X"), Y("Input to Y") {}


contract C is X,Y {
    constructor(string memory _name,string memory _text)  X(_name) Y(_text) {}
}

contract D is  X,Y{
        constructor() X("X was called") Y("Y was called") {}
}

contract E is X, Y {
    constructor() Y("Y was called") X("X was called") {}
}
