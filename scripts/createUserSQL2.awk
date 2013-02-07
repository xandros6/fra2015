BEGIN {
        FS="\t"
      }
      
$3!="\\N"&&$3!="XXX" {
  print 'ciao'
}
                

END {
}