echo "Isminiz nedir?"
read isim
echo "Merhaba $isim eger egitime kayitli misiniz? (y/n)"
read cevap
if [ "$cevap" = "y" ]
then
    echo Egitime hosgeldiniz.
else
    echo Lutfen kaydolunuz.
fi
