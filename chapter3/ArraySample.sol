pragma solidity ^0.5.0;

contract ArraySample {
    uint[5] public fArray = [uint(10), 20, 30, 40, 50];
    uint[] public dArray;
    
    function getFixedArray() public payable returns(uint[5] memory){
        uint[5] storage  a = fArray;
        for(uint i = 0; i < a.length; i++){
            a[i] = i + 1;
        }
        return a;
    }
    
    function getFixedArray2() public view returns(uint[5] memory){
        uint[5] storage b = fArray;
        return b;
    }
    
    function pushFixedArray() public view returns(uint){
        // fArray.push(x);
        return fArray.length;
    }
    
    function pushDArray(uint x) public payable returns(uint){
        return dArray.push(x);
    }
    
    
    function getDArrayLength() public view returns(uint){
        return dArray.length;
    }
    
    function initDArray(uint len) public {
        dArray.length = len;
        for (uint i = 0; i < len; i++){
            dArray[i] = i + 1;
        }
    }
    
    function getDArray() public view returns (uint[] memory){
        return dArray;
    }
    
    function delDArray() public returns(uint) {
        delete dArray;
        return dArray.length;
    }
    
    function delfArray() public returns(uint) {
        delete fArray;
        return fArray.length;
    }
}