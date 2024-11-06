// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MiniSocial {
    struct Post {
        string message;
        address author;
        uint agreeCount;
        uint disagreeCount;
    }

    Post[] public posts;
    //mapping the agrement and disagrement comments

    mapping(uint => mapping(address => bool)) public hasAgreed;
    mapping(uint => mapping(address => bool)) public hasDisagreed;
    mapping(uint => mapping(address => string)) public agreementMessages;
    mapping(uint => mapping(address => string)) public disagreementMessages;
    mapping(uint => address[]) public agreementAddresses;
    mapping(uint => address[]) public disagreementAddresses;
    //publish a post
    function publishPost(string memory _message) public {
        posts.push(Post({
            message: _message,
            author: msg.sender,
            agreeCount: 0,
            disagreeCount: 0
        }));
    }

    // agree with apost with providing why 
    function agreeWithPost(uint postId, string memory _arg) public {
        require(postId < posts.length, "Post does not exist.");
        require(!hasAgreed[postId][msg.sender], "You have already agreed.");
        require(!hasDisagreed[postId][msg.sender], "You cannot agree after disagreeing.");

        Post storage post = posts[postId];
        post.agreeCount++;
        hasAgreed[postId][msg.sender] = true;
        agreementMessages[postId][msg.sender] = _arg;
        agreementAddresses[postId].push(msg.sender);
    }

     // disagree with apost with providing why 
    function disagreeWithPost(uint postId, string memory _arg) public {
        require(postId < posts.length, "Post does not exist.");
        require(!hasDisagreed[postId][msg.sender], "You have already disagreed.");
        require(!hasAgreed[postId][msg.sender], "You cannot disagree after agreeing.");

        Post storage post = posts[postId];
        post.disagreeCount++;
        hasDisagreed[postId][msg.sender] = true;
        disagreementMessages[postId][msg.sender] = _arg;
        disagreementAddresses[postId].push(msg.sender);
    }

    //get the total count of posts
    function getTotalPosts() public view returns (uint) {
        return posts.length;
    }

    //groping data into struct to return the post information
    struct PostData {
        string message;
        address author;
        uint agreeCount;
        uint disagreeCount;
        string[] userAgreementMessages;
        string[] userDisagreementMessages;
    }

    //get the details about a post
    function getPost(uint postId) public view returns (PostData memory) {
        require(postId < posts.length, "Post does not exist.");

        Post storage post = posts[postId];
        uint agreeCount = agreementAddresses[postId].length;
        uint disagreeCount = disagreementAddresses[postId].length;

        string[] memory userAgreementMessages = new string[](agreeCount);
        string[] memory userDisagreementMessages = new string[](disagreeCount);

        for (uint i = 0; i < agreeCount; i++) {
            address user = agreementAddresses[postId][i];
            userAgreementMessages[i] = agreementMessages[postId][user];
        }

        for (uint i = 0; i < disagreeCount; i++) {
            address user = disagreementAddresses[postId][i];
            userDisagreementMessages[i] = disagreementMessages[postId][user];
        }

        return PostData({
            message: post.message,
            author: post.author,
            agreeCount: post.agreeCount,
            disagreeCount: post.disagreeCount,
            userAgreementMessages: userAgreementMessages,
            userDisagreementMessages: userDisagreementMessages
        });
    }
}
