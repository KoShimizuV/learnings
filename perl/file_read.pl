
open(OUT,"> w.txt");
print OUT  "a";
close(OUT);


open(IN, "w.txt");
while(<IN>){
  print;
}
close(IN);
