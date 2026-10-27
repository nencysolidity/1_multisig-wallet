## **Overview**

This is a Solidity‑based MultiSignature Wallet smart contract deployed on the 5ireChain Thunder Testnet. 
It enables multiple owners to confirm and execute transactions securely, ensuring decentralized control over fund transfers.

## **Tools & Technologies Used**
- Solidity 0.8.31  
- Remix IDE  
- MetaMask  
- 5ireChain Thunder Testnet

## **Proofs**
### Remix - 
Shows successful compilation and transaction execution in Remix IDE.  

### MetaMask -
Transaction confirmed in MetaMask with gas fee details.

### 5ire Explorer -
On‑chain explorer view confirming contract deployment. 

## **How to Deploy**

### ** 1. Compile in Remix**
Compile MultiSig.sol in Remix IDE (Solidity 0.8.31).

### **2. Configure MetaMask**
Connect MetaMask with 5ireChain Thunder Testnet. Fund the wallet with test tokens.
Connect Remix to MetaMask using Injected Provider – MetaMask.

### 3. Deploy Contract
Deploy the contract from Remix, MetaMask will prompt for confirmation, check gas fee details and approve.

### 4. Verify Deployment
- Open 5ire Explorer and search your wallet address or transaction hash.
- Confirm the contract deployment transaction, block number, and gas fee.
- Cross‑check with MetaMask transaction history for proof.

## **Smart Contract Summary**

- Multiple owners can submit and confirm transactions.
- Execution requires reaching the required number of confirmations.
- Events are logged for transparency and auditing.

## **Acknowledgment**
This project was inspired by MultiSig Wallet tutorial by Code Eater. I followed the learning resource and added my own deployment proofs, documentation, and structure for portfolio purposes.







