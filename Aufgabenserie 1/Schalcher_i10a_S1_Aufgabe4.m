clear;
clc;
dezimal = input('Bitte Zahl eingeben: ');
basis = input('Bitte Basis eingeben: ');
mantisse = input('Bitte Mantissenlänge eingeben: ');
zaehler = 1;

dezimal_ganz = fix(dezimal);
nachkomma_ganz = dezimal - dezimal_ganz;

while (dezimal_ganz>0)==1,
    vorkomma_zahl(zaehler) = mod(dezimal_ganz,basis);
    dezimal_ganz=(dezimal_ganz-vorkomma_zahl(zaehler))/basis;
    zaehler=zaehler+1;
end

zaehler=1;
while (nachkomma_ganz>0)==1,
    nachkomma_zahl(zaehler) = fix(nachkomma_ganz*basis);
    nachkomma_ganz=(nachkomma_ganz*basis)-nachkomma_zahl(zaehler);
    zaehler = zaehler + 1;
end

vorkomma_zahl = fliplr(vorkomma_zahl);

for i=1:max(size(vorkomma_zahl)),
    zahl(i) = int2str(vorkomma_zahl(i));
end

zahl(max(size(zahl))+1)='.';

for i=1:max(size(nachkomma_zahl)),
    zahl(max(size(zahl))+1)=int2str(nachkomma_zahl(i));
end
vorkomma_zahl
nachkomma_zahl
zahl