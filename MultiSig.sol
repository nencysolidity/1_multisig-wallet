// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

contract MultiSig {
    address[] public owners;
    uint public numConfirmationsrequired;

    struct Transaction{
        address to;
        uint value;
        bool executed;
    }
    mapping(uint=>mapping(address=>bool)) isConfirmed;
    Transaction[] public transactions;

    event Transactionsubmitted (uint transactionId,address sender,address receiver,uint amount);
    event TransactionConfirmed(uint transactionId);
    event TransactionExecuted(uint transactionId);
    constructor(address[] memory _owners,uint _numConfirmationsrequired){
        require(_owners.length>1,"Owners should be greater than 1");
        require(_numConfirmationsrequired>0 && _numConfirmationsrequired<=_owners.length,"Num of confirmations must be in sync with num of owners");

        for(uint i=0;i<_owners.length;i++){
            require(_owners[i]!=address(0),"Invalid owner");
            owners.push(_owners[i]);
        }
        numConfirmationsrequired=_numConfirmationsrequired;    
    }
    
    function submitTransaction(address _to) public payable{
        require(_to!=address(0),"Invalid Receiver's address");
        require(msg.value>0,"Transfer value should be greater than o");
        uint transactionId= transactions.length;
        transactions.push(Transaction({to:_to,value:msg.value,executed:false}));
        emit Transactionsubmitted(transactionId, msg.sender,_to, msg.value);
    }

    function confirmTransaction(uint _transactionId) public{
        require(_transactionId<transactions.length, "Invalid transaction Id");
        require(!isConfirmed[_transactionId][msg.sender],"Transaction is already confirmed by owner.");
        isConfirmed[_transactionId][msg.sender]=true;
        emit TransactionConfirmed(_transactionId);
        if(isTransactionConfirmed(_transactionId)){
            executeTransaction(_transactionId);
        }
    }

    function executeTransaction(uint _transactionId) public payable{
       require(_transactionId<transactions.length,"Invalid Transaction Id");
       require(!transactions[_transactionId].executed,"Transaction is already executed");
       (bool success,) =transactions[_transactionId].to.call{value: transactions[_transactionId].value}("");
       require(success,"Transaction can't be executed");
       transactions[_transactionId].executed=true;
       emit  TransactionExecuted(_transactionId);
    }

    function isTransactionConfirmed(uint _transactionId) public view returns(bool){
        require(_transactionId<transactions.length,"Invalid Transaction Id");
        uint confirmationCount;

        for(uint i=0;i<owners.length;i++){
            if (isConfirmed[_transactionId][owners[i]]){
                confirmationCount++;
            }
        }
        return confirmationCount>=numConfirmationsrequired;

    }
  
}