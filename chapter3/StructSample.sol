pragma solidity ^0.5.0;

contract StructSample{
    struct User{
        address addr;
        string name;
    }
    User[] public userList;
    function addUser(string memory _name) public returns (uint) {
        uint id = userList.push(User({
            addr: msg.sender,
            name: _name
        }));
        return (id - 1);
    }
    
    function addUser2(string memory _name) public returns (uint) {
        userList.length += 1;
        uint id = userList.length - 1;
        userList[id].addr = msg.sender;
        userList[id].name = _name;
        return id;
    }
    function editUser(uint _id, string memory _name) public{
        if(userList.length <= _id || userList[_id].addr != msg.sender){
            revert();
        }
        userList[_id].name = _name;
    }
    function getUser(uint _id) public view  returns(address, string memory){
        return (userList[_id].addr, userList[_id].name);
    }
}