# Decentralized Lucky Draw
[![My Skills](https://skillicons.dev/icons?i=solidity)](https://skillicons.dev)  [![Ethereum](https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Ethereum-icon-purple.svg/50px-Ethereum-icon-purple.svg.png)](https://ethereum.org)

## Introduction

**Decentralized Lucky Draw** is a blockchain-based smart contract built on Ethereum using Solidity. This contract allows users to participate in a decentralized Lucky Draw ticket-purchasing system, where users (buyers) can buy tickets, and an organizer can later draw a winner at random. The winner is granted the ability to withdraw the total collected Ether.

The contract demonstrates key features like:
- Role-based access control (organizers vs. buyers).
- Secure ticket purchasing mechanism.
- Pseudo-random winner selection.
- Secure fund withdrawal by the winner.

This project is a simple and secure solution for decentralized raffle systems, ensuring fairness and transparency through blockchain technology.

## Features

- **Role-based Access**: Users are assigned roles of either Organizer or Buyer.
- **Ticket Purchase**: Buyers can purchase tickets by sending Ether to the contract.
- **Random Winner Selection**: The Organizer can draw a winner when all tickets are sold.
- **Secure Fund Withdrawal**: Only the winner is allowed to withdraw the total collected Ether.
- **Blockchain Transparency**: Every transaction and role assignment is recorded on the Ethereum blockchain for transparency.

---

## Smart Contract Functions

1. **AssignRole**: Assigns a role (Organizer/Buyer) to a user.
2. **GetRole**: Returns the assigned role of a specific user.
3. **getNoOfSoldTickets**: Returns the total number of tickets sold.
4. **getNoOfAvailableTickets**: Returns the number of tickets still available.
5. **purchaseTicket**: Allows a buyer to purchase a ticket, provided certain conditions are met.
6. **DrawWinner**: The Organizer can draw a random winner after all tickets are sold.
7. **getWinner**: Allows the Organizer to view the selected winner.
8. **WithDrawEther**: The winner can withdraw the total Ether collected from ticket sales.

---

## Project Structure

- **Solidity Version**: 0.8.0
- **Ethereum Network**: Compatible with any Ethereum-based network.
- **Remix IDE**: This project is easily deployable and executable in the Remix Ethereum IDE.

---

## How to Run the Project

### Prerequisites

- **Remix IDE**: The contract is designed to be deployed and tested using [Remix](https://remix.ethereum.org/).
  ## OR
- **MetaMask**: Install and configure [MetaMask](https://metamask.io/) to connect to the Ethereum test network.
- **Test Ether**: Use a faucet to get test Ether on your chosen network (Ropsten, Rinkeby, etc.).

### Steps to Run

1. **Clone the Repository**:  
   Clone the GitHub repository where the smart contract is stored:
   ```bash
   git clone https://github.com/codeterrayt/Decentralized-Raffle-System.git
   ```

2. **Open Remix IDE**:  
   Go to [Remix](https://remix.ethereum.org/), an online Solidity IDE.

3. **Load the Contract**:  
   - In Remix, click on the `File Explorer` panel on the left.
   - Create a new file and paste the smart contract code from this repository.

4. **Compile the Contract**:  
   - In Remix, click on the `Solidity Compiler` icon on the left.
   - Select the Solidity version `0.8.0` and compile the contract.

5. **Deploy the Contract**:  
   - Go to the `Deploy & Run Transactions` tab.
   - Click on `Deploy`

6. **Assign Roles**:  
   - Use the `AssignRole` function to assign `ORGANIZER` to your address and assign other users as `BUYER`.

7. **Purchase Tickets**:  
   - Buyers can call the `purchaseTicket` function and send exactly `1 Ether` to buy a ticket.

8. **Draw Winner**:  
   - Once all tickets are sold, the Organizer can call the `DrawWinner` function to select a winner.

9. **Withdraw Ether**:  
   - The winner can then call the `WithDrawEther` function to withdraw the total Ether in the contract.

---

## Security Considerations

- **Role Verification**: Only users with the `BUYER` role can purchase tickets, and only the `ORGANIZER` can draw a winner or check the winner's address.
- **Randomness**: The winner selection uses pseudo-randomness from block attributes (timestamp and previous block random seed). While not perfect for high-value lotteries, it is sufficient for small-scale raffles.
- **Ether Handling**: The contract securely transfers Ether to the winner and ensures the contract has sufficient balance before processing the transfer.

---

## Conclusion

This project demonstrates how smart contracts on the Ethereum blockchain can enable decentralized and trustless raffle systems. The transparency and immutability of the blockchain ensure fairness, while the role-based access control ensures that only authorized users can perform sensitive actions like drawing the winner and withdrawing the prize.

