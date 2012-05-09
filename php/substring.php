<?php

function substring($haystack,$needle) {
	if("" == $needle) { return 0; }
	echo "Haystack: $haystack\nNeedle: $needle\n";
	$h_length = strlen($haystack);
	$n_length = strlen($needle);	
	for( $i=0; ($h_length - $i) >= $n_length; $i++){
		$found = true;
		for($j=0;$j<$n_length;$j++) {
			if($needle[$j] != $haystack[$i+$j]) {
				$found = false;
				continue;
			}
		}
		if($found) {
			echo " . . . . . . SUCCESS!!!! startPos: $i\n";
			return $i;
		}
	}
	echo " . . . . . . FAILURE!\n" ;
	return -1;
}

substring("haystack","hay");
!substring("ack","hoy");
substring("hayhayhay","hayhay");
substring("mucho22","22");
!substring("str","string");
?>
