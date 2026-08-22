def sieve($lim):
  range(2; $lim + 1)
  | . as $i
  | select(
		all(
			range(2; (($i | sqrt) | floor) + 1);
			$i % . != 0
		  )
      );

.limit as $lim
  | [sieve($lim)]
