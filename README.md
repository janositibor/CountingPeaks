# CountingPeaks
Matlab script for counting peaks in electrophysiological recording


01. Run the script countingPeaks.m in Matlab
02. Define basic parameters for the input file
![Input fields to define params](/info/01-DefineParams.png)
03. Browse input file to process
![Input fields to define params](/info/02-ChooseInputFile.png)

Nem biztos, hogy magától értetődő, ezért a biztonság kedvéért pár sorban összefoglalom.

1.lépés: nyers adatsor beolvasása "filename.dat".

2.lépés: korábban megszámlált csúcsok beolvasása "output_filename.txt". Ha itt "Mégse"-t választasz, akkor elvégzi az automatikus csúcskijelölést.

3.lépés: kattints a "ZoomIn" ikonra és válaszd ki, hogy milyen nagyításban tudsz jól dolgozni az adatokkal. Ha túltoltad használd a "ZoomOut"-ot!

4.lépés: válts vissza a "hand" kurzorra. Így végig tudsz görgetni a felvételen.

5.lépés: csúcs hozzáadáas: vidd a kurzort egy tetszőleges helyre és nyomj "space"-t

6.lépés: csúcs törlése: vidd a kurzort a törlendő csúcs közelébe (nyilván nem kell pont rá) és nyomj egy "Delete"-t

7.lépés: "Esc" gomb megnyomásával menti a jelölt csúcsokat ugyanabban a könyvtárban "output_filename.txt" néven. Ezután bezárhatod a grafikont!

Hirtelen ennyi, ha nem világos szólj! 
