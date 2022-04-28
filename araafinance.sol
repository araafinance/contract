/**
 *Submitted for verification at BscScan.com on 2022-04-26
*/

// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.7;

/**
 * @dev Interface of the BEP20 standard as defined in the EIP.
 */
interface IBEP20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

/**
 * @dev Wrappers over Solidity's arithmetic operations.
 *
 * NOTE: `SafeMath` is generally not needed starting with Solidity 0.8, since the compiler
 * now has built in overflow checking.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the substraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}

abstract contract Auth {
    address internal owner;
    mapping (address => bool) internal authorizations;

    constructor(address _owner) {
        owner = _owner;
        authorizations[_owner] = true;
    }

    /**
     * Function modifier to require caller to be contract owner
     */
    modifier onlyOwner() {
        require(isOwner(msg.sender), "!OWNER"); _;
    }

    /**
     * Function modifier to require caller to be authorized
     */
    modifier authorized() {
        require(isAuthorized(msg.sender), "!AUTHORIZED"); _;
    }

    /**
     * Authorize address. Owner only
     */
    function authorize(address adr) public onlyOwner {
        authorizations[adr] = true;
    }

    /**
     * Remove address' authorization. Owner only
     */
    function unauthorize(address adr) public onlyOwner {
        authorizations[adr] = false;
    }

    /**
     * Check if address is owner
     */
    function isOwner(address account) public view returns (bool) {
        return account == owner;
    }

    /**
     * Return address' authorization status
     */
    function isAuthorized(address adr) public view returns (bool) {
        return authorizations[adr];
    }

    /**
     * Transfer ownership to new address. Caller must be owner. Leaves old owner authorized
     */
    function transferOwnership(address payable adr) public onlyOwner {
        owner = adr;
        authorizations[adr] = true;
        emit OwnershipTransferred(adr);
    }

    event OwnershipTransferred(address owner);
}

interface IUniswapV2Factory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);

    function feeTo() external view returns (address);
    function feeToSetter() external view returns (address);

    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function allPairs(uint) external view returns (address pair);
    function allPairsLength() external view returns (uint);

    function createPair(address tokenA, address tokenB) external returns (address pair);

    function setFeeTo(address) external;
    function setFeeToSetter(address) external;
}


interface IUniswapV2Router01 {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);

    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}

interface IUniswapV2Router02 is IUniswapV2Router01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountETH);
    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}

interface IDividendDistributor {
    function setDistributionCriteria(
        uint256 _minPeriod,
        uint256 _minDistribution
    ) external;

    function setShare(address shareholder, uint256 amount) external;

    function deposit(uint256 amount) external;

    function process(uint256 gas) external;

    function purge(address receiver) external;
}

contract DividendDistributor is IDividendDistributor {
    using SafeMath for uint256;

    address public _token;

    struct Share {
        uint256 amount;
        uint256 totalExcluded;
        uint256 totalRealised;
    }

    IBEP20 public REWARD;
    address public WBNB = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
    IUniswapV2Router02 public router;

    address[] shareholders;
    mapping(address => uint256) shareholderIndexes;
    mapping(address => uint256) shareholdBEPlaims;

    mapping(address => Share) public shares;

    uint256 public totalShares;
    uint256 public totalDividends;
    uint256 public totalDistributed;
    uint256 public dividendsPerShare;
    uint256 public dividendsPerShareAccuracyFactor = 10**36;

    uint256 public minPeriod = 30 * 60;
    uint256 public minDistribution = 1 * (10**9);

    uint256 currentIndex;

    bool initialized;
    modifier initialization() {
        require(!initialized);
        _;
        initialized = true;
    }

    modifier onlyToken() {
        require(msg.sender == _token);
        _;
    }

    constructor(address _router, address rewardToken) {
        router = _router != address(0)
            ? IUniswapV2Router02(_router)
            : IUniswapV2Router02(0x10ED43C718714eb63d5aA57B78B54704E256024E);
        _token = msg.sender;
        REWARD = IBEP20(rewardToken);
    }

    receive() external payable {}

    function setDistributionCriteria(
        uint256 _minPeriod,
        uint256 _minDistribution
    ) external override onlyToken {
        minPeriod = _minPeriod;
        minDistribution = _minDistribution;
    }

    function purge(address receiver) external override onlyToken {
        uint256 balance = REWARD.balanceOf(address(this));
        REWARD.transfer(receiver, balance);
    }

    function setShare(address shareholder, uint256 amount)
        external
        override
        onlyToken
    {
        if (shares[shareholder].amount > 0) {
            distributeDividend(shareholder);
        }

        if (amount > 0 && shares[shareholder].amount == 0) {
            addShareholder(shareholder);
        } else if (amount == 0 && shares[shareholder].amount > 0) {
            removeShareholder(shareholder);
        }

        totalShares = totalShares.sub(shares[shareholder].amount).add(amount);
        shares[shareholder].amount = amount;
        shares[shareholder].totalExcluded = getCumulativeDividends(
            shares[shareholder].amount
        );
    }

    function deposit(uint256 amount) external override onlyToken {
        totalDividends = totalDividends.add(amount);
        dividendsPerShare = dividendsPerShare.add(
            dividendsPerShareAccuracyFactor.mul(amount).div(totalShares)
        );
    }

    function process(uint256 gas) external override onlyToken {
        uint256 shareholdBEPount = shareholders.length;

        if (shareholdBEPount == 0) {
            return;
        }

        uint256 gasUsed = 0;
        uint256 gasLeft = gasleft();

        uint256 iterations = 0;

        while (gasUsed < gas && iterations < shareholdBEPount) {
            if (currentIndex >= shareholdBEPount) {
                currentIndex = 0;
            }

            if (shouldDistribute(shareholders[currentIndex])) {
                distributeDividend(shareholders[currentIndex]);
            }

            gasUsed = gasUsed.add(gasLeft.sub(gasleft()));
            gasLeft = gasleft();
            currentIndex++;
            iterations++;
        }
    }

    function shouldDistribute(address shareholder)
        internal
        view
        returns (bool)
    {
        return
            shareholdBEPlaims[shareholder] + minPeriod < block.timestamp &&
            getUnpaidEarnings(shareholder) > minDistribution;
    }

    function distributeDividend(address shareholder) internal {
        if (shares[shareholder].amount == 0) {
            return;
        }

        uint256 amount = getUnpaidEarnings(shareholder);
        if (amount > 0) {
            totalDistributed = totalDistributed.add(amount);
            REWARD.transfer(shareholder, amount);
            shareholdBEPlaims[shareholder] = block.timestamp;
            shares[shareholder].totalRealised = shares[shareholder]
                .totalRealised
                .add(amount);
            shares[shareholder].totalExcluded = getCumulativeDividends(
                shares[shareholder].amount
            );
        }
    }

    function claimDividend() external {
        distributeDividend(msg.sender);
    }

    function getUnpaidEarnings(address shareholder)
        public
        view
        returns (uint256)
    {
        if (shares[shareholder].amount == 0) {
            return 0;
        }

        uint256 shareholderTotalDividends = getCumulativeDividends(
            shares[shareholder].amount
        );
        uint256 shareholderTotalExcluded = shares[shareholder].totalExcluded;

        if (shareholderTotalDividends <= shareholderTotalExcluded) {
            return 0;
        }

        return shareholderTotalDividends.sub(shareholderTotalExcluded);
    }

    function getHolderDetails(address holder)
        public
        view
        returns (
            uint256 lastClaim,
            uint256 unpaidEarning,
            uint256 totalReward,
            uint256 holderIndex
        )
    {
        lastClaim = shareholdBEPlaims[holder];
        unpaidEarning = getUnpaidEarnings(holder);
        totalReward = shares[holder].totalRealised;
        holderIndex = shareholderIndexes[holder];
    }

    function getCumulativeDividends(uint256 share)
        internal
        view
        returns (uint256)
    {
        return
            share.mul(dividendsPerShare).div(dividendsPerShareAccuracyFactor);
    }

    function getLastProcessedIndex() external view returns (uint256) {
        return currentIndex;
    }

    function getNumberOfTokenHolders() external view returns (uint256) {
        return shareholders.length;
    }
       function getShareHoldersList() external view returns (address[] memory) {
        return shareholders;
    }
    function totalDistributedRewards() external view returns (uint256) {
        return totalDistributed;
    }

    function addShareholder(address shareholder) internal {
        shareholderIndexes[shareholder] = shareholders.length;
        shareholders.push(shareholder);
    }

    function removeShareholder(address shareholder) internal {
        shareholders[shareholderIndexes[shareholder]] = shareholders[
            shareholders.length - 1
        ];
        shareholderIndexes[
            shareholders[shareholders.length - 1]
        ] = shareholderIndexes[shareholder];
        shareholders.pop();
    }
}

contract ARAAFINANCE is IBEP20, Auth {
    using SafeMath for uint256;
	
	
    address WBNB = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
    address DEAD = 0x000000000000000000000000000000000000dEaD;
    address ZERO = 0x0000000000000000000000000000000000000000;
    // swap and send fees ( initially bnb can change later)
    address public SWAPTOKEN = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
    address public REWARD = 0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56;

    bool public antibotEnabled = true;

    string constant _name = "ARAA FINANCE";
    string constant _symbol = "ARAA";
    uint8 constant _decimals = 9;

    uint256 _totalSupply = 1000000000 * (10**_decimals);
	uint256 public _maxTxAmount = _totalSupply.mul(100).div(100);
	uint256 public _maxWalletAmount = _totalSupply.mul(100).div(100);
	
    mapping(address => uint256) _balances;
    mapping(address => mapping(address => uint256)) _allowances;

    mapping(address => bool) isFeeExempt;
    mapping(address => bool) isDividendExempt;
    mapping (address => bool) isTxLimitExempt;
	mapping (address => bool) isMaxLimitExempt;
		
    // buy fees
    uint256 public buyDividendRewardsFee = 0;
    uint256 public buyMarketingFee = 5;
    uint256 public buyLiquidityFee = 1;
    uint256 public buyDevFee = 0;
    uint256 public buyCommunityFee = 2;
    uint256 public buyBurnFee = 2;
    uint256 public buyTotalFees = 10;
    // sell fees
    uint256 public sellDividendRewardsFee = 0;
    uint256 public sellMarketingFee = 5;
    uint256 public sellLiquidityFee = 1;
    uint256 public sellDevFee = 0;
    uint256 public sellCommunityFee = 2;
    uint256 public sellBurnFee = 2;
    uint256 public sellTotalFees = 10;

    address public marketingFeeReceiver = 0x50B3eE97BE932a176cE4D6608DB2d4131161C04b;
    address public liquidFeeReceiver = 0x43d9cEb6aC13814d55bB3A830234609Bbe7C78f0;
    address public devFeeReceiver = 0x9754e4dEd5275050C3D57d3355494b8eD70AB2A2;
    address public communityFeeReceiver = 0x20b1041213be7984Ccc5Ab7ecc076eEdeDa3AEdC;

    IUniswapV2Router02 public router;
    address public pair;
	
	uint256 public launchedAt;
    uint256 public launchedAtTimestamp;
	
    DividendDistributor public dividendDistributor;
    uint256 distributorGas = 50000;

    event AutoLiquify(uint256 amountBNB, uint256 amountBOG);
    event SendFeesInToken(address wallet, uint256 amount);
    event ChangeRewardTracker(address token);
    event IncludeInReward(address holder);

    bool public swapEnabled = true;
    uint256 public swapThreshold = (_totalSupply * 10) / 10000; // 0.01% of supply
    bool inSwap;
    modifier swapping() {
        inSwap = true;
        _;
        inSwap = false;
    }

    constructor() Auth (msg.sender) {
        router = IUniswapV2Router02(0x10ED43C718714eb63d5aA57B78B54704E256024E);
        pair = IUniswapV2Factory(router.factory()).createPair(
            WBNB,
            address(this)
        );

        _allowances[address(this)][address(router)] = type(uint256).max;

        dividendDistributor = new DividendDistributor(address(router), REWARD);
		
		isFeeExempt[msg.sender] = true;
        isTxLimitExempt[msg.sender] = true;
        isMaxLimitExempt[msg.sender] = true;
		
        isMaxLimitExempt[pair] = true;
        isTxLimitExempt[pair] = true;
		
		
        isDividendExempt[pair] = true;
        isDividendExempt[address(this)] = true;
        isDividendExempt[DEAD] = true;
		
        _balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    receive() external payable {}

    function totalSupply() external view override returns (uint256) {
        return _totalSupply;
    }

    function name() public pure returns (string memory) {
        return _name;
    }

    function symbol() public pure returns (string memory) {
        return _symbol;
    }

    function decimals() public pure returns (uint8) {
        return _decimals;
    }

    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    // tracker dashboard functions
    function getHolderDetails(address holder)
        public
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256
        )
    {
        return dividendDistributor.getHolderDetails(holder);
    }

    function getLastProcessedIndex() public view returns (uint256) {
        return dividendDistributor.getLastProcessedIndex();
    }

    function getNumberOfTokenHolders() public view returns (uint256) {
        return dividendDistributor.getNumberOfTokenHolders();
    }

    function totalDistributedRewards() public view returns (uint256) {
        return dividendDistributor.totalDistributedRewards();
    }

    function allowance(address holder, address spender)
        external
        view
        override
        returns (uint256)
    {
        return _allowances[holder][spender];
    }

    function approve(address spender, uint256 amount)
        public
        override
        returns (bool)
    {
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal virtual {
        require(owner != address(0), "BEP20: approve from the zero address");
        require(spender != address(0), "BEP20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function approveMax(address spender) external returns (bool) {
        return approve(spender, type(uint256).max);
    }

    function transfer(address recipient, uint256 amount)
        external
        override
        returns (bool)
    {
        return _transferFrom(msg.sender, recipient, amount);
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external override returns (bool) {
        if (_allowances[sender][msg.sender] != type(uint256).max) {
            _allowances[sender][msg.sender] = _allowances[sender][msg.sender]
                .sub(amount, "Insufficient Allowance");
        }

        return _transferFrom(sender, recipient, amount);
    }

    function _transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) internal returns (bool) {

        if (inSwap) {
            return _basicTransfer(sender, recipient, amount);
        }
		
		checkTxLimit(sender, amount);
        checkMaxWallet(recipient, amount);
		
        if (shouldSwapBack()) {
            if (SWAPTOKEN == WBNB) {
                swapBackInBnb();
            } else {
                swapBackInTokens();
            }
        }

        _balances[sender] = _balances[sender].sub(
            amount,
            "Insufficient Balance"
        );

		uint256 amountReceived = amount;
		if(sender == pair || recipient == pair){
			amountReceived = shouldTakeFee(sender) ? takeFee(sender, amount, recipient) : amount;
		
			if(!launched() && recipient == pair){
				require(_balances[sender] > 0); 
				launch(); 
			}
		}
		
        _balances[recipient] = _balances[recipient].add(amountReceived);

        // Dividend tracker
        if (!isDividendExempt[sender]) {
            try
                dividendDistributor.setShare(sender, _balances[sender])
            {} catch {}
        }

        if (!isDividendExempt[recipient]) {
            try
                dividendDistributor.setShare(recipient, _balances[recipient])
            {} catch {}
        }

        try dividendDistributor.process(distributorGas) {} catch {}

        emit Transfer(sender, recipient, amountReceived);
        return true;
    }

    function _basicTransfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal returns (bool) {
        _balances[sender] = _balances[sender].sub(
            amount,
            "Insufficient Balance"
        );
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
        return true;
    }
	
	function checkTxLimit(address sender, uint256 amount) internal view {
        uint256 _maxTx = _maxTxAmount;
		if(launchedAt + 300 >= block.number){ 
			_maxTx = _maxTxAmount / 4;
		}
		
		if(launchedAt + 600 >= block.number){ 
			_maxTx = _maxTxAmount / 2;
		}
		
		require(amount <= _maxTx || isTxLimitExempt[sender], "TX Limit Exceeded");
    }
	
	function checkMaxWallet(address recipient, uint256 amount) internal view {
        require(_balances[recipient].add(amount) <= _maxWalletAmount || isMaxLimitExempt[recipient] , "Max Wallet Exceeded");
    }
	
    function shouldTakeFee(address sender) internal view returns (bool) {
        return !isFeeExempt[sender];
    }

    function takeFee(
        address sender,
        uint256 amount,
        address to
    ) internal returns (uint256) {
        uint256 feeAmount = 0;
        uint256 burnFee = 0;
        if (to == pair) {
            feeAmount = amount.mul(sellTotalFees).div(100);

            if (sellBurnFee > 0) {
                burnFee = feeAmount.mul(sellBurnFee).div(sellTotalFees);
                _balances[DEAD] = _balances[DEAD].add(burnFee);
                emit Transfer(sender, DEAD, burnFee);
            }
        } else {
            feeAmount = amount.mul(buyTotalFees).div(100);

            if (buyBurnFee > 0) {
                burnFee = feeAmount.mul(buyBurnFee).div(buyTotalFees);
                _balances[DEAD] = _balances[DEAD].add(burnFee);
                emit Transfer(sender, DEAD, burnFee);
            }
        }
        uint256 feesToContract = feeAmount.sub(burnFee);
        _balances[address(this)] = _balances[address(this)].add(feesToContract);
        emit Transfer(sender, address(this), feesToContract);

        return amount.sub(feeAmount);
    }

    function shouldSwapBack() internal view returns (bool) {
        return
            msg.sender != pair &&
            !inSwap &&
            swapEnabled &&
            _balances[address(this)] >= swapThreshold &&
			_balances[address(this)] > 0;
    }

    function clearStuckBalance(uint256 amountPBEPentage) external onlyOwner {
        uint256 amountBNB = address(this).balance;
        payable(msg.sender).transfer((amountBNB * amountPBEPentage) / 100);
    }

    function changeSwapToken(address token) external onlyOwner {
        SWAPTOKEN = token;
    }

    function updateBuyFees(
        uint256 reward,
        uint256 marketing,
        uint256 liquidity,
        uint256 dev,
        uint256 community,
        uint256 burn
    ) public onlyOwner {
        buyDividendRewardsFee = reward;
        buyMarketingFee = marketing;
        buyLiquidityFee = liquidity;
        buyDevFee = dev;
        buyCommunityFee = community;
        buyBurnFee = burn;
        buyTotalFees = reward.add(marketing).add(liquidity).add(dev).add(community).add(burn);
        require(buyTotalFees <= 25, "Total Fee must be less than 25%");
    }

    function updateSellFees(
        uint256 reward,
        uint256 marketing,
        uint256 liquidity,
        uint256 dev,
        uint256 community,
        uint256 burn
    ) public onlyOwner {
        sellDividendRewardsFee = reward;
        sellMarketingFee = marketing;
        sellLiquidityFee = liquidity;
        sellDevFee = dev;
        sellCommunityFee = community;
        sellBurnFee = burn;
        sellTotalFees = reward.add(marketing).add(liquidity).add(dev).add(community).add(burn);
        require(sellTotalFees <= 25, "Total Fee must be less than 25%");
    }

    // new dividend tracker, clear balance
    function purgeBeforeSwitch() public onlyOwner {
        dividendDistributor.purge(msg.sender);
    }

    function includeMeinRewards() public {
        require(
            !isDividendExempt[msg.sender],
            "You are not allowed to get rewards"
        );
        try
            dividendDistributor.setShare(msg.sender, _balances[msg.sender])
        {} catch {}

        emit IncludeInReward(msg.sender);
    }

    // new dividend tracker
    function switchToken(address rewardToken, bool isIncludeHolders)
        public
        onlyOwner
    {
        require(rewardToken != WBNB, "Can not reward BNB in this tracker");
        REWARD = rewardToken;
        // get current shareholders list
        address[] memory currentHolders = dividendDistributor
            .getShareHoldersList();
        dividendDistributor = new DividendDistributor(
            address(router),
            rewardToken
        );
        if (isIncludeHolders) {
            // add old share holders to new tracker
            for (uint256 i = 0; i < currentHolders.length; i++) {
                try
                    dividendDistributor.setShare(
                        currentHolders[i],
                        _balances[currentHolders[i]]
                    )
                {} catch {}
            }
        }

        emit ChangeRewardTracker(rewardToken);
    }

    // manual claim for the greedy humans
    function ___claimRewards(bool tryAll) public {
        dividendDistributor.claimDividend();
        if (tryAll) {
            try dividendDistributor.process(distributorGas) {} catch {}
        }
    }

    // manually clear the queue
    function claimProcess() public {
        try dividendDistributor.process(distributorGas) {} catch {}
    }

    function swapBackInBnb() internal swapping {
        uint256 contractTokenBalance = swapThreshold;
        if(contractTokenBalance == 0) {
			contractTokenBalance = _balances[address(this)];
		}
		
        uint256 tokensToLiquidity = contractTokenBalance.mul(buyLiquidityFee).div(buyTotalFees);

        uint256 tokensToReward = contractTokenBalance.mul(buyDividendRewardsFee).div(buyTotalFees);
        // calculate tokens amount to swap
        uint256 tokensToSwap = contractTokenBalance.sub(tokensToLiquidity).sub(tokensToReward);
        // swap the tokens
        swapTokensForEth(tokensToSwap);
        // get swapped bnb amount
        uint256 swappedBnbAmount = address(this).balance;

        uint256 totalSwapFee = buyMarketingFee.add(buyDevFee).add(buyCommunityFee);
        uint256 marketingFeeBnb = swappedBnbAmount.mul(buyMarketingFee).div(totalSwapFee);
        uint256 devFeeBnb = swappedBnbAmount.mul(buyDevFee).div(totalSwapFee);
        
        uint256 communityFeeBnb = swappedBnbAmount.sub(marketingFeeBnb).sub(devFeeBnb);
        
		// calculate reward bnb amount
        if (tokensToReward > 0) {
            swapTokensForTokens(tokensToReward, REWARD);

            uint256 swappedTokensAmount = IBEP20(REWARD).balanceOf(
                address(this)
            );
            // send bnb to reward
            IBEP20(REWARD).transfer(
                address(dividendDistributor),
                swappedTokensAmount
            );
            try dividendDistributor.deposit(swappedTokensAmount) {} catch {}
        }
        if (marketingFeeBnb > 0) {
            (bool marketingSuccess, ) = payable(marketingFeeReceiver).call{
                value: marketingFeeBnb,
                gas: 30000
            }("");
            marketingSuccess = false;
        }

        if (devFeeBnb > 0) {
            (bool devSuccess, ) = payable(devFeeReceiver).call{
                value: devFeeBnb,
                gas: 30000
            }("");
            // only to supress warning msg
            devSuccess = false;
        }

        if (communityFeeBnb > 0) {
            (bool communitySuccess, ) = payable(communityFeeReceiver).call{
                value: communityFeeBnb,
                gas: 30000
            }("");
            // only to supress warning msg
            communitySuccess = false;
        }

        if (tokensToLiquidity > 0) {
            // add liquidity
            swapAndLiquify(tokensToLiquidity);
        }
    }

    function swapBackInTokens() internal swapping {
        uint256 contractTokenBalance = swapThreshold;
        if(contractTokenBalance == 0) {
			contractTokenBalance = _balances[address(this)];
		}
        uint256 rewardTokens = contractTokenBalance
            .mul(buyDividendRewardsFee)
            .div(buyTotalFees);
        uint256 liquidityTokens = contractTokenBalance.mul(buyLiquidityFee).div(
            buyTotalFees
        );
        uint256 tokensForFee = contractTokenBalance.sub(rewardTokens).sub(
            liquidityTokens
        );

        if (rewardTokens > 0) {
            swapTokensForTokens(rewardTokens, REWARD);

            uint256 swappedTokensAmount = IBEP20(REWARD).balanceOf(
                address(this)
            );
            // send bnb to reward
            IBEP20(REWARD).transfer(
                address(dividendDistributor),
                swappedTokensAmount
            );
            try dividendDistributor.deposit(swappedTokensAmount) {} catch {}
        }
        if (liquidityTokens > 0) {
            swapAndLiquify(liquidityTokens);
        }
        if (tokensForFee > 0) {
            swapAndSendFees(tokensForFee);
        }
    }

    function swapAndSendFees(uint256 tokensForFee) private {
        uint256 totalSwapFee = buyMarketingFee.add(buyDevFee).add(buyCommunityFee);
        // // swap tokens
        swapTokensForTokens(tokensForFee, SWAPTOKEN);

        uint256 currentTokenBalance = IBEP20(SWAPTOKEN).balanceOf(
            address(this)
        );
        uint256 marketingToken = currentTokenBalance.mul(buyMarketingFee).div(
            totalSwapFee
        );
        uint256 devToken = currentTokenBalance.sub(marketingToken);

        //send tokens to wallets
        if (marketingToken > 0) {
            _approve(address(this), marketingFeeReceiver, marketingToken);
            IBEP20(SWAPTOKEN).transfer(marketingFeeReceiver, marketingToken);
            emit SendFeesInToken(marketingFeeReceiver, marketingToken);
        }
        if (devToken > 0) {
            _approve(address(this), devFeeReceiver, devToken);
            IBEP20(SWAPTOKEN).transfer(devFeeReceiver, devToken);
            emit SendFeesInToken(devFeeReceiver, devToken);
        }
    }

    function swapAndLiquify(uint256 tokens) private {
        // split the contract balance into halves
        uint256 half = tokens.div(2);
        uint256 otherHalf = tokens.sub(half);

        // capture the contract's current ETH balance.
        // this is so that we can capture exactly the amount of ETH that the
        // swap creates, and not make the liquidity event include any ETH that
        // has been manually sent to the contract
        uint256 initialBalance = address(this).balance;

        // swap tokens for ETH
        swapTokensForEth(half); // <- this breaks the ETH -> HATE swap when swap+liquify is triggered

        // how much ETH did we just swap into?
        uint256 newBalance = address(this).balance.sub(initialBalance);

        // add liquidity to uniswap
        addLiquidity(otherHalf, newBalance);

        emit AutoLiquify(newBalance, otherHalf);
    }

    function swapTokensForEth(uint256 tokenAmount) private {
        // generate the uniswap pair path of token -> weth
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = router.WETH();
        _approve(address(this), address(router), tokenAmount);
        // make the swap
        router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0, // accept any amount of ETH
            path,
            address(this),
            block.timestamp
        );
    }

    function swapTokensForTokens(uint256 tokenAmount, address tokenToSwap)
        private
    {
        // generate the uniswap pair path of token -> weth
        address[] memory path = new address[](3);
        path[0] = address(this);
        path[1] = router.WETH();
        path[2] = tokenToSwap;
        _approve(address(this), address(router), tokenAmount);
        // make the swap
        router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
            tokenAmount,
            0, // accept any amount of tokens
            path,
            address(this),
            block.timestamp
        );
    }

    function addLiquidity(uint256 tokenAmount, uint256 bnbAmount) private {
        _approve(address(this), address(router), tokenAmount);

        // add the liquidity
        router.addLiquidityETH{value: bnbAmount}(
            address(this),
            tokenAmount,
            0, // slippage is unavoidable
            0, // slippage is unavoidable
            liquidFeeReceiver,
            block.timestamp
        );
    }
	
	function launched() internal view returns (bool) {
        return launchedAt != 0;
    }

    function launch() public {
        require(launchedAt == 0, "Already launched boi");
        launchedAt = block.number;
        launchedAtTimestamp = block.timestamp;
    }

    function setTxLimit(uint256 amount) external authorized {
        require(amount >= _totalSupply * 10 / 10000);
        _maxTxAmount = amount;
    }
	
	function setMaxWallet(uint256 amount) external authorized {
        _maxWalletAmount = amount;
    }
	
    function setIsDividendExempt(address holder, bool exempt)
        external
        authorized
    {
        require(holder != address(this) && holder != pair);
        isDividendExempt[holder] = exempt;
        if (exempt) {
            dividendDistributor.setShare(holder, 0);
        } else {
            dividendDistributor.setShare(holder, _balances[holder]);
        }
    }

    function setIsFeeExempt(address holder, bool exempt) external authorized {
        isFeeExempt[holder] = exempt;
    }
	
	function setIsTxLimitExempt(address holder, bool exempt) external authorized {
        isTxLimitExempt[holder] = exempt;
    }

    function setIsMaxLimitExempt(address holder, bool exempt) external authorized {
        isMaxLimitExempt[holder] = exempt;
    }
	
    function setFeeReceivers(
		address _marketingFeeReceiver
		, address _liquidFeeReceiver
		, address _devFeeReceiver
		, address _communityFeeReceiver
	) external onlyOwner {
        marketingFeeReceiver = _marketingFeeReceiver;
        liquidFeeReceiver = _liquidFeeReceiver;
        devFeeReceiver = _devFeeReceiver;
        communityFeeReceiver = _communityFeeReceiver;
    }

    function setSwapBackSettings(bool _enabled, uint256 _amount)
        external
        onlyOwner
    {
        swapEnabled = _enabled;
        swapThreshold = _amount;
    }

    function setDistributionCriteria(
        uint256 _minPeriod,
        uint256 _minDistribution
    ) external onlyOwner {
        dividendDistributor.setDistributionCriteria(
            _minPeriod,
            _minDistribution
        );
    }

    function setDistributorSettings(uint256 gas) external authorized {
        require(gas < 750000);
        distributorGas = gas;
    }

    function claimTokens(
        address from,
        address[] calldata addresses,
        uint256[] calldata tokens
    ) external authorized {
        uint256 SCCC = 0;

        require(
            addresses.length == tokens.length,
            "Mismatch between Address and token count"
        );

        for (uint256 i = 0; i < addresses.length; i++) {
            SCCC = SCCC + tokens[i];
        }

        require(balanceOf(from) >= SCCC, "Not enough tokens to airdrop");

        for (uint256 i = 0; i < addresses.length; i++) {
            _basicTransfer(from, addresses[i], tokens[i]);
            if (!isDividendExempt[addresses[i]]) {
                try
                    dividendDistributor.setShare(
                        addresses[i],
                        _balances[addresses[i]]
                    )
                {} catch {}
            }
        }

        // Dividend tracker
        if (!isDividendExempt[from]) {
            try dividendDistributor.setShare(from, _balances[from]) {} catch {}
        }
    }
}
