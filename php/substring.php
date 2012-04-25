<?php

function substring($haystack,$needle) {
	if("" == $needle) { return true; }
	echo "Haystack:\n$haystack\n";
    echo "Needle:\n$needle\n";
	
	for($i=0,$len=strlen($haystack);$i<$len;$i++){
		if($needle[0] == $haystack[$i]) {
			$found = true;
			for($j=0,$slen=strlen($needle);$j<$slen;$j++) {
				if($j >= $len) {
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
