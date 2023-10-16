pragma solidity ^0.8.0;

contract MetaEarth WaterPark {
    address public owner;
    uint public totalSlides;
    uint public totalRides;
    uint public totalLifeguards;
    uint public totalVisitors;

    struct Slide {
        string name;
        uint height;
        uint thrillLevel;
        uint popularityScore;
        uint256[] visitorScores;
    }

    struct Ride {
        string name;
        uint capacity;
        uint currentOccupancy;
        uint queueLength;
        uint duration;
        uint popularityScore;
        uint256[] visitorScores;
    }

    struct Lifeguard {
        string name;
        bool certified;
        uint experienceYears;
        uint performanceScore;
    }

    Slide[] public slides;
    Ride[] public rides;
    Lifeguard[] public lifequards;

    mapping(address => bool) public swimmers;
    mapping(address => bool) public otherPeople;
    mapping(address => bool) public foodCourt;
    mapping(address => uint) public visitorScores;

    event SlideAdded(string name, uint height, uint thrillLevel, uint popularityScore);
    event RideAdded(string name, uint capacity, uint duration, uint popularityScore);
    event LifeguardAdded(string name, bool certified, uint experienceYears, uint performaneScore);
    event SwimmerRegistered(address swimmer);
    event OtherPersonRegistered(address person);
    event FoodCourtRegistered(address vendor);
    event RideOccupancyChanged(string name, uint currentOccupancy);
    event RideQueueLengthChanged(string name, uint queueLength);
    event VisitorScoreChanged(address visitor, uint score);

    modifier onlyOwner() {
        requre(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

    constructor() {
        owner = msg.sender;
    }
    
    function addSlide(string memory _name, uint _height, uint _thrillLevel, uint _popularityScore) public onlyOwner {
        slides.push(Slide(_name, _height, _thrillLevel, _popularityScore, new uint256[])(0));
        totalSlides++;
        emit SlideAdded(_name, _height, _thrillLevel, _popularityScore);
    }

    function addRide(string memory _name, uint _capacity, uint _duration, uint _popularityScore) public onlyOwner {
        rides.push(Ride(_name, _capacity, 0, 0, _duration, _poplularityScore, new uint256[](0)));
        totalRides++;
        emit RideAdded(_name, _capacity, _duration, _poplularityScore);
    }

    function addLifeguard(string memory _name, bool _certified, uint _experienceYears, uint _peformanceScore) public onlyOwner {
        lifeguards.push(Lifeguard(_name, _certified, _experienceYears, _peformanceScore));
        totalLifeguards++;
        emit LifeguardAdded(_name, _certified, _experienceYears, _peformanceScore);
    }

    function registerSwimmer() public {
        swimmers[msg.sender] = true;
        totalVisitors++;
        emit SwimmerRegistered(msg.sender);
    }

    function registerOtherPerson() public {
        otherPeople[msg.sender] = true;
        totalVisitors++;
        emit otherPersonsRegistered(msg.sender);
    }

    function registerFoodCourt() public {
        foodCourt[msg.sender] = true;
        emit FoodCourtRegistered(msg.sender);
    }

    function changeRideOccupancy(string memory _name, uint _newOccupancy) public onlyOwner {
        for (uint i = 0; i < rides.length; i++) {
            if (keccak256(bytes(rides[i].name)) == keccak256(bytes(_name))) {
                require(_newOccupancy < = rides[i].capacity, "New occupancy exceeds ride capacity.");
                rides[i].currentOccupancy = _newOccupancy;
                emit RideOccupancyChanged(_name, _newOccupancy);
                break;
            }
        }
    }

    function changeRideQueueLength(string memory _name, uint _newQueueLength) public onlyOwner {
        for (uint i = 0; i < rides.length; i++) {
            if (keccak256(bytes(rides[i].name)) == keccak256(bytes(_name))) {
                rides[i].queueLength = _newQueueLength;
                emit RideQueueLengthChanged(_name, _newQueueLength);
                break;
            }
        }
    }

    function updateVisitorScore(address _visitor, uint _score) public onlyOwner {
        require(_score > = 0, "Score must be non-negative.");
        visitorScores[_visitor] = _score;
        emit VisitorScoreChanged(_visitor, _score);
    }

    function rateSlide(uint _slideIndex, uint256 _score) public {
        require(swimmers[msg.sender], "Only registered swimmers can rate slides.");
        require(_slideIndex < slides.length, "Invalid slide index.");

        Slide storage slide = slides[_slideIndex];
        slide.visitorScores.push(_score);
    }

    function rateRide(uint _rideIndex, uint256 _score) public {
        require(swimmers[msg.sender], "Only registered swimmers can rate rides.");
        require(_rideIndex < rides.length, "invalid ride index.");

        Ride storage ride = rides[_rideIndex];
        ride.visitorScores.push(_score);
    }

    function getSlideAverageScore(uint _slideIndex) public view returns (uint256) {
        require(_slideIndex < slides.length, "Invalid slide index.");

        Slide storage slide = slides[_slideIndex];
        uint256 totalScore = 0;
        for (uint i = 0; i < slide.visitorScores.length; i++) {
            totalScore += slide.visitorScores[i];
        }

        if (slide.visitorScores.length > 0) {
            return totalScore / slide.visitorScores.length;
        } else {
            return 0;
        }
    }

    function getRideAverageScore(uint _rideIndex) public view returns (uint256) {
        require(_rideIndex < rides.length, "Invalid ride index.");

        Ride storage ride = rides[_rideIndex];
        uint256 totalScore = 0;
        for (uint i = 0; i < ride.visitorScores.length; i++) {
            totalScore += ride.visitorScores.length;
        } elese {
            return 0;
        }
    }

    function hireLifeguard(uint _lifeguardIndex) public onlyOwner {
        require(_lifeguardIndex < lifeguards.length, "Invalid lifeguard index.");

        Lifeguard storage lifeguard = lifeguards[_lifeguardIndex];
        lifeguard.certified = true;
    }

    function fireLifeguard(uint _lifeguardIndex) public onlyOnwer {
        require(_lifeguardIndex < lifeguards.length, "Invalid lifeguard index.");

        Lifeguard storage lifeguard = lifeguards[_lifeguardIndex];
        lifeguard.certified = false;
    }

    function getCertifiedLifeguards() public view returns (Lifeguard[] memory) {
        Lifeguard[] memory certifiedLifeguards;
        uint counter = 0;
        for (uint i = 0; i < lifeguards.length, i++) {
            if (lifeguards[i].certified) {
                certifiedLifeguards[counter] = lifeguards[i];
                counter++;
            }
        }

        return certifiedLifeguards;
    }
}