# Shell dili ile kodlanmış basit bir sayı tahmin oyunu. YUInformatics üyeleri için kodlanmıştır.
# Geliştiren: Emrecan ÖKSÜM
# İletişim: ben@emreoksum.com.tr, emreoksum@gmail.com, 05344839345
# Instagram: @eoksum    :)


# Giriş, tanıtım vs.

echo Sayı tahmin oyununa hoşgeldiniz. Lütfen alt menuden oyun parametrelerini belirleyiniz.
echo "[Oyuncu 1] Lütfen bir sayi belireyiniz: "; read sayi
echo "[Oyuncu 1] Tahmin eden oyuncunun kac tahmin hakki olacak? :"; read kactahmin
echo "Oyun 6 saniye icinde baslayacak lutfen ekran temizlendigi zaman klavyeyi Oyuncu 2'ye verin..."
sleep 6 # 6 saniye boyunca uyu
clear # Konsol çıktısını temizle

echo "[Oyuncu 2] Sayı tahmin oyununa hoşgeldiniz oyuncu 2. $kactahmin kadar tahmin hakkınız var."

# Oyuncu1'i önden başlat çünkü sayıyı belirleyen o, Oyuncu 2nin tahmin edememesi durumunda kesin kazanacak olan her ihtimalde Oyuncu1.
oyuncu1=1
oyuncu2=0

# Bolum ile oyuncu 1in girdigi sayının tam olarak bolundugu sayıları ipucu olarak bul.
function kaca_tam_bolunur {
	
	sayi=$1
	iter=1 # iterator. 1den sayi degiskenine kadar olan tum sayıları alttaki döngüde bölmeyi denettirir.
	while [ $iter -lt $sayi ]
	do
		if (( $sayi % $iter == 0 )); then
			echo "Tahmin etmeye calıştığınız sayı $iter ile tam olarak bölünebiliyor."
		fi
		iter=$(( $iter+1 ))
	done
}

# Oyuncu 2nin tahmin yapması için for döngüsü

toplamdeneme=0
while [ $toplamdeneme -le $kactahmin ]
do
	echo "[Oyuncu 2] Oyuncu 1'in belirlediği sayıyı tahmin etmeye çalışın. Kalan tahmin hakkınız: $(( $kactahmin-$toplamdeneme )) Tahmininizi giriniz: "; read tahmin
	if [ "$tahmin" == "$sayi" ]; then
		oyuncu2=1
		echo "Oyuncu 2, Oyuncu 1'in belirlediği sayıyı tutturdu ve oyunu kazandı."
		break
		
	else
		echo "Oyuncu 2 sayıyı doğru bilemedi. Oyuncu 2 için ipucu: "; kaca_tam_bolunur "$sayi"
	fi
	toplamdeneme=$(( $toplamdeneme+1 ))
done

# Döngü sonunda oyun illaki bitmiş olacak çünkü iki ihtimal var, ya Oyuncu1in belirlediği sayıyı Oyuncu2 tahmin edecek
# ya da Oyuncu2 için önceden belirlenen tahmin hakkı bitmiş olacak.

echo "Oyun bitti!"

# Skorları karşılaştır ve oyunu kimin kazandığını belirleyip kazananı ilan et.

if [ $oyuncu2 == 0 ]; then
	echo "Oyunu oyuncu 1 kazandı!"
else
	echo "Oyunu oyuncu 2 kazandı!"
fi