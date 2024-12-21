# Decentralized Career Mentorship Program

## Project Description
The Decentralized Career Mentorship Program is a blockchain-based platform that connects mentors and mentees in a trustless, transparent environment. Built on the Ethereum blockchain, this smart contract facilitates secure mentor-mentee relationships, automated payments, and session scheduling, all while maintaining the decentralized nature of Web3.

## Contract Address
0xeBAD13BA43DC6709c0D4d78b0cA72d819b455d08
![image](https://github.com/user-attachments/assets/2e32d371-8cfb-4f7c-9a42-b97de9b80816)


## Project Vision
Our vision is to revolutionize professional mentorship by leveraging blockchain technology to create a transparent, efficient, and accessible platform. By removing traditional intermediaries and utilizing smart contracts, we aim to:

1. Democratize access to professional mentorship
2. Ensure fair compensation for mentors
3. Create transparent and immutable records of mentorship sessions
4. Build a global, decentralized community of professionals
5. Reduce barriers to entry for both mentors and mentees

## Key Features

### Smart Contract Functionality
- **Mentor Registration**: Professionals can register as mentors with their expertise and hourly rates
- **Mentee Registration**: Users can register as mentees with their learning goals
- **Automated Session Booking**: Smart contract handles session scheduling and payment processing
- **Availability Management**: Mentors can toggle their availability status
- **Session Tracking**: All sessions are recorded on the blockchain for transparency

### Technical Specifications
- Built on Solidity ^0.8.0
- Implements secure payment handling
- Gas-optimized for cost-effective transactions
- Event emission for frontend tracking
- Pure view functions for data retrieval

### Core Structs
```solidity
Mentor {
    address wallet
    string name
    string expertise
    uint256 hourlyRate
    bool isAvailable
}

Mentee {
    address wallet
    string name
    string goal
}

Session {
    address mentor
    address mentee
    uint256 startTime
    uint256 endTime
    uint256 amountPaid
}
```

### Key Functions
1. **registerMentor**
   - Register professional mentors
   - Set expertise and hourly rates
   - Initialize availability status

2. **registerMentee**
   - Register users seeking mentorship
   - Set learning goals and preferences

3. **bookSession**
   - Schedule mentorship sessions
   - Handle automatic payments
   - Record session details

4. **toggleAvailability**
   - Allow mentors to manage their availability
   - Prevent bookings when unavailable

5. **getSessionsCount**
   - Track total sessions conducted
   - Monitor platform activity


## Future Enhancements
1. Implement rating and review system
2. Add dispute resolution mechanism
3. Include session cancellation functionality
4. Integrate video calling capabilities
5. Add multi-token payment support

