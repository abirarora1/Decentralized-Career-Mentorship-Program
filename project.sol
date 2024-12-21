// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CareerMentorship {
    struct Mentor {
        address wallet;
        string name;
        string expertise;
        uint256 hourlyRate;
        bool isAvailable;
    }

    struct Mentee {
        address wallet;
        string name;
        string goal;
    }

    struct Session {
        address mentor;
        address mentee;
        uint256 startTime;
        uint256 endTime;
        uint256 amountPaid;
    }

    mapping(address => Mentor) public mentors;
    mapping(address => Mentee) public mentees;
    Session[] public sessions;

    event MentorRegistered(address indexed wallet, string name, string expertise, uint256 hourlyRate);
    event MenteeRegistered(address indexed wallet, string name, string goal);
    event SessionBooked(address indexed mentor, address indexed mentee, uint256 startTime, uint256 endTime, uint256 amountPaid);

    function registerMentor(string memory _name, string memory _expertise, uint256 _hourlyRate) public {
        require(mentors[msg.sender].wallet == address(0), "Mentor already registered.");
        require(_hourlyRate > 0, "Hourly rate must be greater than 0.");

        mentors[msg.sender] = Mentor({
            wallet: msg.sender,
            name: _name,
            expertise: _expertise,
            hourlyRate: _hourlyRate,
            isAvailable: true
        });

        emit MentorRegistered(msg.sender, _name, _expertise, _hourlyRate);
    }

    function registerMentee(string memory _name, string memory _goal) public {
        require(mentees[msg.sender].wallet == address(0), "Mentee already registered.");

        mentees[msg.sender] = Mentee({
            wallet: msg.sender,
            name: _name,
            goal: _goal
        });

        emit MenteeRegistered(msg.sender, _name, _goal);
    }

    function bookSession(address _mentor, uint256 _startTime, uint256 _endTime) public payable {
    Mentor storage mentorData = mentors[_mentor];
    require(mentorData.wallet != address(0), "Mentor not found.");
    require(mentorData.isAvailable, "Mentor is not available.");
    require(_endTime > _startTime, "Invalid session time.");
    uint256 sessionFee = (_endTime - _startTime) * mentorData.hourlyRate / 3600;
    require(msg.value >= sessionFee, "Insufficient funds sent for the session.");
    
    sessions.push(Session({
        mentor: _mentor,
        mentee: msg.sender,
        startTime: _startTime,
        endTime: _endTime,
        amountPaid: sessionFee
    }));
    
    address payable mentorWallet = payable(mentorData.wallet);
    mentorWallet.transfer(sessionFee);
    
    emit SessionBooked(_mentor, msg.sender, _startTime, _endTime, sessionFee);
}

    function getSessionsCount() public view returns (uint256) {
        return sessions.length;
    }

    function toggleAvailability() public {
        Mentor storage mentor = mentors[msg.sender];
        require(mentor.wallet != address(0), "Only registered mentors can toggle availability.");
        mentor.isAvailable = !mentor.isAvailable;
    }
}
