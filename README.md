# MiniSocial Smart Contract - README

## Overview
The **MiniSocial** smart contract is a simple social media-like platform, named *Depat*, built on the Ethereum blockchain. Users can publish posts on topics they wish to discuss, and others can agree or disagree with the post, adding their arguments to support their position. This creates a structured space for debate on the blockchain.

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

3. **Disagree with a Post**:
   ```solidity
   disagreeWithPost(0, "Blockchain is too energy-intensive.")
   ```

4. **View Post Details**:
   ```solidity
   getPost(0)
   ```

## Restrictions
   - A user cannot both agree and disagree with the same post.
   - Each user can only agree or disagree once per post.

This contract promotes structured, decentralized debates by enforcing clear rules for interactions.