// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MyLover{
struct Lover{
uint256 id;
bytes32 name;
bool isStillLove;
}
Lover[] loverArr;
event Log(uint256 amount,uint256 gas);
uint256 totalNumber;
constructor() {
totalNumber=0;
}

function getBlance() external view returns(uint256){
    return address(this).balance;
}

function getAmountOfLover() view public returns(uint256){
    return totalNumber;
}

function addLover(bytes32 _name) public payable{
    Lover memory tmp=Lover(totalNumber,_name,true);
    totalNumber+=1;
    loverArr.push(tmp);
    if (msg.value>0)
    {
        emit Log(msg.value,gasleft());
    }
}

//
function doNotLove(bytes32 _name) public payable{
    for (uint256 i=0;i<totalNumber;i++)
    {
        if (loverArr[i].name==_name)
        {
            loverArr[i].isStillLove=false;
            break;
        }
    }
    if (msg.value>0)
    {
        emit Log(msg.value,gasleft());
    }
}

//
function getLover(uint256 _id) public view returns(uint256,bytes32){
    require(_id<totalNumber,"your id is too big");
    require(_id>=0,"your id is too small");
    return (loverArr[_id].id,loverArr[_id].name);
}
}