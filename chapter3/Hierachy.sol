pragma solidity ^0.5.0;

contract A {
    uint internal a;
    
    function setA(uint _a) public {
        a = _a;
    }
    function getData() public view returns(uint) {
        return a;
    }
}

contract B is A {
    function getData() public view returns (uint) {
        return a * 10;
    }
}

contract C {
    A[] private c;
    function makeContract() public returns (uint, uint) {
        c.length = 2;
        A a = new A();
        a.setA(1);
        c[0] = a;
        B b = new B();
        b.setA(1);
        c[1] = b;
        return (c[0].getData(), c[1].getData());
    }
}