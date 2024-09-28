// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LuckyDraw {

    uint private NoOfTicketSold = 0;
    uint private MaxNoOfTickets = 2;
    uint private ticket_price = 1 ether;

    mapping(address => bool) private purchased;
    mapping(address => Role) private role;

    address[] private buyers;
    address private winner_address;

    enum Role{
        ORGANIZER,
        BUYER
    }

    modifier OnlyBuyer(){
        require(role[msg.sender] == Role.BUYER);
        _;
    }

    modifier OnlyOrganizer(){
        require(role[msg.sender] == Role.ORGANIZER);
        _;
    }

    function AssignRole(address _user, Role rolee) public{
        role[_user] = rolee;
    }

    function GetRole(address _user) public view returns(Role){
        return role[_user];
    }


    function getNoOfSoldTickets() public view returns (uint){
        return NoOfTicketSold;
    }

    function getNoOfAvailableTickets() public view returns (uint){
        return MaxNoOfTickets - NoOfTicketSold;
    }

    function DrawWinner() public OnlyOrganizer {
        require(role[msg.sender] == Role.ORGANIZER, "Only Organizer Can Draw the Winner");
        require(MaxNoOfTickets == NoOfTicketSold, "Max Tickets is not Sold Yet");

         // Generating a pseudo-random number between 0 and 10
         // keccak256 is a cryptographic hash function used to create a pseudo-random value.
         // abi.encodePacked combines block attributes like block.timestamp and block.prevrandao  with the msg.sender.
         // Since the Ethereum merge (with the Paris hard fork), the block.difficulty has been replaced by block.prevrandao for randomness in Proof-of-Stake (PoS) blocks
         // % 11 ensures the result is between 0 and 10 (% 11 means remainder when divided by 11).
        uint randomNumber = uint(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, msg.sender))) % buyers.length;
        
        winner_address = buyers[randomNumber];
    }

    function getWinner() public view OnlyOrganizer returns (address){
        require(role[msg.sender] == Role.ORGANIZER, "Only Organizer Can Draw the Winner");
        require(MaxNoOfTickets == NoOfTicketSold, "Max Tickets is not Sold Yet");

        return winner_address;

    }

     function purchaseTicket() public OnlyBuyer payable {
        require(role[msg.sender] == Role.BUYER, "Only Buyer can buy the ticket!");
        require(!purchased[msg.sender], "You have already purchased a ticket!");
        require(NoOfTicketSold < MaxNoOfTickets, "No more tickets available!");
        require(msg.value == ticket_price, "Incorrect ticket price!");
     
        purchased[msg.sender] = true;
        NoOfTicketSold++;
        buyers.push(msg.sender);
    }

    function WithDrawEther() public OnlyBuyer {
        require(winner_address == msg.sender, "Only Winner Can Withdraw the Ether");

        uint amountToSend = ticket_price * MaxNoOfTickets;

        // Ensure the contract has enough balance to send
        require(address(this).balance >= amountToSend, "Insufficient contract balance.");

        // Send the specified amount to the winner_address using call
        (bool success, ) = winner_address.call{value: amountToSend}("");
        require(success, "Transfer failed.");

        // Reset the state if necessary
        for (uint i = 0; i < buyers.length; i++) {
            purchased[buyers[i]] = false;
        }

        delete buyers;
        NoOfTicketSold = 0;
    }
}
