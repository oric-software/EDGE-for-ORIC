.dsb 256-(*&255)
_EDGEBEGIN
_Edgesize
.byt 8

_EdgeSX
.byt 4

_EdgeSY
.byt 4

_Edgestart
.byt 7,1,1
.byt 7,1,1
.byt 7,1,1
.byt 7,1,1

.byt 7,1,1
.byt 7,1,1
.byt 7,1,1
.byt 7,1,1

.byt 7,1,1
.byt 7,1,1
.byt 7,1,1
.byt 7,1,1

.byt 7,1,1
.byt 7,1,1
.byt 7,1,1
.byt 7,1,1


_Edgecible
.byt 7,7,1
.byt 7,7,1
.byt 7,7,1
.byt 7,7,1

.byt 7,7,1
.byt 7,7,1 
.byt 7,7,1
.byt 7,7,1

.byt 7,7,1
.byt 7,7,1
.byt 7,7,1
.byt 7,7,1

.byt 7,7,1
.byt 7,7,1
.byt 7,7,1
.byt 7,7,1


EdgetitleAdressLow
	.byt <(Edgetitle11)
	.byt <(Edgetitle12)
	.byt <(Edgetitle13)
	.byt <(Edgetitle14)
	.byt <(Edgetitle21)
	.byt <(Edgetitle22)
	.byt <(Edgetitle23)
	.byt <(Edgetitle24)
	.byt <(Edgetitle31)
	.byt <(Edgetitle32)
	.byt <(Edgetitle33)
	.byt <(Edgetitle34)
	.byt <(Edgetitle41)
	.byt <(Edgetitle42)
	.byt <(Edgetitle43)
	.byt <(Edgetitle44)
	.byt <(EdgeMap)
           
EdgetitleAdressHigh
	.byt >(Edgetitle11)
	.byt >(Edgetitle12)
	.byt >(Edgetitle13)
	.byt >(Edgetitle14)
	.byt >(Edgetitle21)
	.byt >(Edgetitle22)
	.byt >(Edgetitle23)
	.byt >(Edgetitle24)
	.byt >(Edgetitle31)
	.byt >(Edgetitle32)
	.byt >(Edgetitle33)
	.byt >(Edgetitle34)
	.byt >(Edgetitle41)
	.byt >(Edgetitle42)
	.byt >(Edgetitle43)
	.byt >(Edgetitle44)
	.byt >(EdgeMap)
	
	
_Edgetitles
Edgetitle11
.byt 01
.asc "TO BE EDITED      "
.byt 0
Edgetitle12
.byt 02
.asc "TO BE EDITED      "
.byt 0
Edgetitle13
.byt 03
.asc "TO BE EDITED      "
.byt 0
Edgetitle14
.byt 04
.asc "TO BE EDITED      "
.byt 0
Edgetitle21
.byt 01
.asc "TO BE EDITED      "
.byt 0
Edgetitle22
.byt 05
.asc "TO BE EDITED      "
.byt 0
Edgetitle23
.byt 02
.asc "TO BE EDITED      "
.byt 0
Edgetitle24
.byt 03
.asc "TO BE EDITED      "
.byt 0
Edgetitle31
.byt 02
.asc "TO BE EDITED      "
.byt 0
Edgetitle32
.byt 03
.asc "TO BE EDITED      "
.byt 0
Edgetitle33
.byt 06
.asc "TO BE EDITED      "
.byt 0
Edgetitle34
.byt 01
.asc "TO BE EDITED      "
.byt 0
Edgetitle41
.byt 07
.asc "TO BE EDITED      "
.byt 0
Edgetitle42
.byt 02
.asc "TO BE EDITED      "
.byt 0
Edgetitle43
.byt 06
.asc "TO BE EDITED      "
.byt 0
Edgetitle44
.byt 05
.asc "TO BE EDITED      "
.byt 0

EdgeMap
.byt 6
.asc "GPS"
.byt 7
.byt 0

_EdgemapAdressLow
	.byt <(Edge11)
	.byt <(Edge12)
	.byt <(Edge13)
	.byt <(Edge14)
	.byt <(Edge21)
	.byt <(Edge22)
	.byt <(Edge23)
	.byt <(Edge24)
	.byt <(Edge31)
	.byt <(Edge32)
	.byt <(Edge33)
	.byt <(Edge34)
	.byt <(Edge41)
	.byt <(Edge42)
	.byt <(Edge43)
	.byt <(Edge44)
           
_EdgemapAdressHigh
	.byt >(Edge11)
	.byt >(Edge12)
	.byt >(Edge13)
	.byt >(Edge14)
	.byt >(Edge21)
	.byt >(Edge22)
	.byt >(Edge23)
	.byt >(Edge24)
	.byt >(Edge31)
	.byt >(Edge32)
	.byt >(Edge33)
	.byt >(Edge34)
	.byt >(Edge41)
	.byt >(Edge42)
	.byt >(Edge43)
	.byt >(Edge44)


.dsb 256-(*&255)


_EDGE
Edge11 
	.byt 0,1,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,1,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,1,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,1,0,0,0,0,0,1


Edge12 
	.byt 0,1,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,1,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,1,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,1,0,0,0,0,0,1

Edge13 
	.byt 0,1,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,1,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,1,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,1,0,0,0,0,0,1


Edge14 
	.byt 0,1,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,1,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,1,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,1,0,0,0,0,0,1

Edge21 

	.byt 0,1,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,1,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,1,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,1,0,0,0,0,0,1

Edge22 
	.byt 0,1,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,1,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,1,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,1,0,0,0,0,0,1

Edge23 
	.byt 0,1,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,1,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,1,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,1,0,0,0,0,0,1

Edge24 
	.byt 0,1,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,1,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,1,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,1,0,0,0,0,0,1

Edge31 ;"Find a way"
	.byt 0,1,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,1,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,1,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,1,0,0,0,0,0,1

Edge32 ;"Etages"
	.byt 0,1,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,1,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,1,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,1,0,0,0,0,0,1

Edge33 ;"La spirale"
	.byt 0,1,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,1,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,1,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,1,0,0,0,0,0,1

Edge34
	.byt 0,1,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,1,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,1,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,1,0,0,0,0,0,1


Edge41
	.byt 0,1,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,1,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,1,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,1,0,0,0,0,0,1

Edge42
	.byt 0,1,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,1,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,1,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,1,0,0,0,0,0,1

Edge43
	.byt 0,1,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,1,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,1,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,1,0,0,0,0,0,1

Edge44
	.byt 0,1,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,1,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,0,0,0,1,0,0,0
	.byt 0,0,0,0,0,0,0,0
	.byt 0,1,0,0,0,0,0,1

_EDGEEND