<?php

function substring($haystack,$needle) {
	echo "Haystack:\n$haystack\n";
    echo "Needle:\n$needle\n";
	// iterate over the the haystack until the first char
	// of the needle is in the haystack
	
	for($i=0,$len=strlen($haystack);$i<$len;$i++){
		if($needle[0] == $haystack[$i]) {
			$found = true;
			for($j=0,$slen=strlen($needle);$j<$slen;$j++) {
				// two ways to check if we have exceeded our length
				if($len-$j <= 0) {
				//if($j >= $len) {
					echo "reached end of haystack but have more needles";
					return false;
				}
				if($needle[$j] != $haystack[$i+$j]) {
					//echo "Mismatch, restart\n";
					$found = false;
					continue;
				}
			}
			if($found) {
				echo " . . . . . . SUCCESS!!!! startPos: $i\n";
				return true;
			}
		}
	}
	echo " . . . . . . FAILURE!\n" ;
	return false;
}

assert(substring("haystack","hay"));
assert(!substring("ack","hoy"));
assert(substring("hayhayhay","hayhay"));
assert(substring("mucho22","22"));
assert(!substring("str","string"));
?>
