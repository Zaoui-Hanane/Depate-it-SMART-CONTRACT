# MiniSocial Smart Contract - README

## Overview
The **MiniSocial** smart contract is a simple social media-like platform, named *Depate It*, built on the Ethereum blockchain. Users can publish posts on topics they wish to discuss, and others can agree or disagree with the post, adding their arguments to support their position. This creates a structured space for debate on the blockchain.

## Key Components

### 1. **Post Struct**
Each post has:
   - `message`: Content of the post.
   - `author`: Address of the user who created the post.
   - `agreeCount`: Number of users who agree with the post.
   - `disagreeCount`: Number of users who disagree with the post.
   - `agreementMessages` and `disagreementMessages`: Stores each user’s argument for agreeing or disagreeing.
   - `agreementAddresses` and `disagreementAddresses`: Lists addresses of users who have agreed or disagreed.

## Key Functions

### `publishPost`
Publishes a new post with a message, initializing it with zero agreements and disagreements.
```solidity
function publishPost(string memory _message) public
```

### `agreeWithPost`
Allows a user to agree with a post, providing an argument.
   - Validates that the post exists and the user hasn't already agreed or disagreed with it.
   - Increments the agree count and records the user’s agreement and argument.
```solidity
function agreeWithPost(uint postId, string memory _arg) public
```

### `disagreeWithPost`
Allows a user to disagree with a post, also requiring an argument.
   - Validates that the post exists and the user hasn’t already disagreed or agreed.
   - Increments the disagree count and records the user’s disagreement and argument.
```solidity
function disagreeWithPost(uint postId, string memory _arg) public
```

### `getTotalPosts`
Returns the total number of posts in the contract.
```solidity
function getTotalPosts() public view returns (uint)
```

### `getPost`
Fetches details of a specific post, including:
   - The post’s message, author, agree and disagree counts.
   - Lists of agreement and disagreement messages from users.
```solidity
function getPost(uint postId) public view returns (PostData memory)
```

### `PostData Struct`
A helper struct for retrieving comprehensive information about a post, including:
   - `message`, `author`, `agreeCount`, `disagreeCount`
   - `userAgreementMessages` and `userDisagreementMessages`: lists of arguments from users who agreed or disagreed.

## Example Usage

1. **Create a Post**: 
   ```solidity
   publishPost("Blockchain should be widely adopted.")
   ```
   ![puplish](https://github.com/user-attachments/assets/214d1a49-e558-4241-bafb-d8e7cd9675c9)

2. **Agree with a Post**:
   ```solidity
   agreeWithPost(0, "Blockchain ensures transparency.")
   ```
   ![agriment](https://github.com/user-attachments/assets/dd081ac2-3cd8-43f9-8d6b-0ae4de630806)
   
4. **Disagree with a Post**:
   ```solidity
   disagreeWithPost(0, "Blockchain is too energy-intensive.")
   ```
   ![disagrement](https://github.com/user-attachments/assets/c0aa48af-7a27-4922-8d45-aba9af310643)

5. **View Post Details**:
   ```solidity
   getPost(0)
   ```
   ![getpost](https://github.com/user-attachments/assets/ad7b4da8-bb86-4ccc-9c1a-9cfb48178fea)

6. **View Posts Counts**:
   ```solidity
   getTotalPosts()
   ```
   ![totalPosts](https://github.com/user-attachments/assets/1436332a-b07b-4376-bcae-706b21077b3d)

## Frontend Integration

The frontend of the **MiniSocial** platform is a simple web application that interacts with the Ethereum smart contract via the `web3.js` library. It allows users to connect their Ethereum wallet, publish posts, and engage with other users' posts. Below are the steps and features of the frontend:

### 1. **Connect Wallet**
- Users must connect their Ethereum wallet (e.g., MetaMask) to interact with the smart contract.
- Once the wallet is connected, the user’s address is displayed on the interface.

### 2. **Post a Message**
Users can publish a post by entering a message and submitting it via a button. The post is recorded on the Ethereum blockchain via the `publishPost` function in the smart contract.

### 3. **View Posts**
The frontend fetches and displays all posts in the feed. Each post includes the author's address, message, the number of likes (agreeCount), and dislikes (disagreeCount). Users can also see the arguments provided by others.

### 4. **Agree/Disagree with a Post**
Users can agree or disagree with posts. This is done by submitting an argument for their position. The count of agreements and disagreements will be updated accordingly.

![1](https://github.com/user-attachments/assets/54e81b8a-74e6-4c96-aae5-52a37a87fd66)

![2](https://github.com/user-attachments/assets/50a76c05-74ac-431f-9985-c0f5636f01ca)

Confirm the transaction

![3](https://github.com/user-attachments/assets/da7c143c-3b89-490f-a42c-24724188434f)

   
## Restrictions
   - A user cannot both agree and disagree with the same post.
   - Each user can only agree or disagree once per post.
     ![agree](https://github.com/user-attachments/assets/f40bef9e-3bbb-4d89-b8e1-bbb4a35c03aa)


