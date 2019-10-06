<p align="center"><b>YENİ: <a href="https://github.com/dylanaraps/pure-sh-bible">saf sh incili (📖 Harici süreçlere alternatif olabilecek saf SH alternatifleri).</a></b></p>

<br>

<p align="center"><img src="https://raw.githubusercontent.com/odb/official-bash-logo/master/assets/Logos/Icons/PNG/512x512.png" width="200px"></p>
<h1 align="center">saf bash incili</h1> <p align="center">Harici süreçlere alternatif olabilecek saf Bash alternatifleri.</p>

<p align="center"> <a href="https://travis-ci.com/dylanaraps/pure-bash-bible"><img src="https://travis-ci.com/dylanaraps/pure-bash-bible.svg?branch=master"></a>
<a href="./LICENSE.md"><img src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
</p>

<br>

<a href="https://leanpub.com/bash/">
<img src="https://s3.amazonaws.com/titlepages.leanpub.com/bash/hero" width="40%" align="right">
</a>

Bu kitabın amacı, yalnızca yerleşik `bash` özelliklerini kullanarak çeşitli görevler yapmanın yaygın olarak bilinen ve ya bilinmeyen yöntemlerini belgelendirmektir. Bu İncil'den pasajları kullanmak, gereksiz bağımlılıkları komut dosyalarından kaldırmanıza yardımcı olabilir ve çoğu durumda onları daha hızlı hale getirebilir. [neofetch](https://github.com/dylanaraps/neofetch) , [pxltrm](https://github.com/dylanaraps/pxltrm) ve daha küçük projeler geliştirirken bu ipuçlarıyla karşılaştım ve birkaç tane keşfettim.

Belgedeki kod parçaları `shellcheck` kullanılarak ve uygun olan yerlerde yazılan testlerle kontrol edilmiştir. Katkıda bulunmak ister misiniz? [CONTRIBUTING.md](https://github.com/dylanaraps/pure-bash-bible/blob/master/CONTRIBUTING.md) dosyasını okuyun. Unit testlerinin nasıl çalıştığı ve İncil'e kod parçası eklerken neyin gerekli olduğu ana hatlarıyla o dosyada belirtilmiştir.

Yanlış tanımlanmış, hatalı ya da düpedüz yanlış bir şey mi gördünüz? Bir sorun açın veya PR gönderin. İncil'de bir şey eksik ise, bir sorun açın ve bir çözüm bulunacaktır.

<br>
<p align="center"><b>Bu kitap aynı zamanda Leanpub üzerinden de satın alınabilir. https://leanpub.com/bash</b></p>
<p align="center"><b>Ya da bana bir kahve alabilirsin.</b>
<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=V7QNJNKS3WYVS"><img src="https://img.shields.io/badge/don-paypal-yellow.svg"></a> <a href="https://www.patreon.com/dyla"><img src="https://img.shields.io/badge/don-patreon-yellow.svg"> </a><a href="https://liberapay.com/2211/"><img src="https://img.shields.io/badge/don-liberapay-yellow.svg"></a>
</p>

<br>

# İçindekiler

<!-- vim-markdown-toc GFM -->

- [ÖNSÖZ](#%C3%B6ns%C3%B6z)
- [METİNLER](#meti%CC%87nler)
  - [Metnin başında ve sonundaki boşlukları temizleme](#metnin-ba%C5%9F%C4%B1nda-ve-sonundaki-bo%C5%9Fluklar%C4%B1-temizleme)
  - [Tüm fazla boşlukları kırpma](#t%C3%BCm-fazla-bo%C5%9Fluklar%C4%B1-k%C4%B1rpma)
  - [Bir metinde regex kullanma](#bir-metinde-regex-kullanma)
  - [Bir sınırlayıcı ile metni bölme](#bir-s%C4%B1n%C4%B1rlay%C4%B1c%C4%B1-ile-metni-b%C3%B6lme)
  - [Bir metni küçük harfe dönüştürme](#bir-metni-k%C3%BC%C3%A7%C3%BCk-harfe-d%C3%B6n%C3%BC%C5%9Ft%C3%BCrme)
  - [Bir metni büyük harfe dönüştürme](#bir-metni-b%C3%BCy%C3%BCk-harfe-d%C3%B6n%C3%BC%C5%9Ft%C3%BCrme)
  - [Metin harf büyüklüğünü ters çevirme](#metin-harf-b%C3%BCy%C3%BCkl%C3%BC%C4%9F%C3%BCn%C3%BC-ters-%C3%A7evirme)
  - [Metinden tırnakları kırpma](#metinden-t%C4%B1rnaklar%C4%B1-k%C4%B1rpma)
  - [Metindeki tüm desen örneklerini kırpma](#metindeki-t%C3%BCm-desen-%C3%B6rneklerini-k%C4%B1rpma)
  - [Metinde bir desenin ilk örneğini kırpma](#metinde-bir-desenin-ilk-%C3%B6rne%C4%9Fini-k%C4%B1rpma)
  - [Metnin başındaki bir deseni kırpma](#metnin-ba%C5%9F%C4%B1ndaki-bir-deseni-k%C4%B1rpma)
  - [Metnin sonundaki bir deseni kırpma](#metnin-sonundaki-bir-deseni-k%C4%B1rpma)
  - [Bir metnin percent-encode çevirimini yapma](#bir-metnin-percent-encode-%C3%A7evirimini-yapma)
  - [Bir metnin percent-encode geri çevirimini yapma](#bir-metnin-percent-encode-geri-%C3%A7evirimini-yapma)
  - [Metnin bir alt metni içerip içermediğini kontrol etme](#metnin-bir-alt-metni-i%C3%A7erip-i%C3%A7ermedi%C4%9Fini-kontrol-etme)
  - [Metnin bir alt metinle başlayıp başlamadığını kontrol etme](#metnin-bir-alt-metinle-ba%C5%9Flay%C4%B1p-ba%C5%9Flamad%C4%B1%C4%9F%C4%B1n%C4%B1-kontrol-etme)
  - [Metnin bir alt metinle bitip bitmediğini kontrol etme](#metnin-bir-alt-metinle-bitip-bitmedi%C4%9Fini-kontrol-etme)
- [DİZİLER](#di%CC%87zi%CC%87ler)
  - [Diziyi ters çevirme](#diziyi-ters-%C3%A7evirme)
  - [Yinelenen dizi öğelerini kaldırma](#yinelenen-dizi-%C3%B6%C4%9Felerini-kald%C4%B1rma)
  - [Rasgele dizi elemanı](#rasgele-dizi-eleman%C4%B1)
  - [Bir dizi içerisinde dolaşma](#bir-dizi-i%C3%A7erisinde-dola%C5%9Fma)
  - [İki değer arasında geçiş yapma](#i%CC%87ki-de%C4%9Fer-aras%C4%B1nda-ge%C3%A7i%C5%9F-yapma)
- [DÖNGÜLER](#d%C3%B6ng%C3%BCler)
  - [Bir sayı aralığında döngü](#bir-say%C4%B1-aral%C4%B1%C4%9F%C4%B1nda-d%C3%B6ng%C3%BC)
  - [Değişken sayı aralığında döngü](#de%C4%9Fi%C5%9Fken-say%C4%B1-aral%C4%B1%C4%9F%C4%B1nda-d%C3%B6ng%C3%BC)
  - [Bir dizi içinde döngü](#bir-dizi-i%C3%A7inde-d%C3%B6ng%C3%BC)
  - [Dizinli bir dizi içinde döngü](#dizinli-bir-dizi-i%C3%A7inde-d%C3%B6ng%C3%BC)
  - [Bir dosyanın içeriği içinde döngü](#bir-dosyan%C4%B1n-i%C3%A7eri%C4%9Fi-i%C3%A7inde-d%C3%B6ng%C3%BC)
  - [Dosyalar ve dizinler içinde döngü](#dosyalar-ve-dizinler-i%C3%A7inde-d%C3%B6ng%C3%BC)
- [DOSYA YÖNETİMİ](#dosya-y%C3%B6neti%CC%87mi%CC%87)
  - [Bir dosya içeriğini metin değişkenine dönüştürme](#bir-dosya-i%C3%A7eri%C4%9Fini-metin-de%C4%9Fi%C5%9Fkenine-d%C3%B6n%C3%BC%C5%9Ft%C3%BCrme)
  - [Dosya içeriğini diziye dönüştürme ( *satır satır* )](#dosya-i%C3%A7eri%C4%9Fini-diziye-d%C3%B6n%C3%BC%C5%9Ft%C3%BCrme--sat%C4%B1r-sat%C4%B1r-)
  - [Bir dosyanın ilk N satırını alma](#bir-dosyan%C4%B1n-ilk-n-sat%C4%B1r%C4%B1n%C4%B1-alma)
  - [Bir dosyanın son N satırını alma](#bir-dosyan%C4%B1n-son-n-sat%C4%B1r%C4%B1n%C4%B1-alma)
  - [Bir dosyadaki satır sayısını alma](#bir-dosyadaki-sat%C4%B1r-say%C4%B1s%C4%B1n%C4%B1-alma)
  - [Dizindeki dosyaları veya dizinleri sayma](#dizindeki-dosyalar%C4%B1-veya-dizinleri-sayma)
  - [Boş bir dosya oluşturma](#bo%C5%9F-bir-dosya-olu%C5%9Fturma)
  - [İki işaret arasındaki satırları ayıklama](#i%CC%87ki-i%C5%9Faret-aras%C4%B1ndaki-sat%C4%B1rlar%C4%B1-ay%C4%B1klama)
- [DOSYA YOLLARI](#dosya-yollari)
  - [Bir dosya yolunun dizin adını alma](#bir-dosya-yolunun-dizin-ad%C4%B1n%C4%B1-alma)
  - [Bir dosya yolunun taban adını alma](#bir-dosya-yolunun-taban-ad%C4%B1n%C4%B1-alma)
- [DEĞİŞKENLER](#de%C4%9Fi%CC%87%C5%9Fkenler)
  - [Bir değişkeni kullanarak bir değişken atama ve erişme](#bir-de%C4%9Fi%C5%9Fkeni-kullanarak-bir-de%C4%9Fi%C5%9Fken-atama-ve-eri%C5%9Fme)
  - [Başka bir değişkeni temel alan bir değişken adı](#ba%C5%9Fka-bir-de%C4%9Fi%C5%9Fkeni-temel-alan-bir-de%C4%9Fi%C5%9Fken-ad%C4%B1)
- [KIRPMA SERİLERİ](#kirpma-seri%CC%87leri%CC%87)
  - [Metin Renkleri](#metin-renkleri)
  - [Metin Nitelikleri](#metin-nitelikleri)
  - [İmleç Hareketi](#i%CC%87mle%C3%A7-hareketi)
  - [Metin Silme](#metin-silme)
- [PARAMETRE GENİŞLETME](#parametre-geni%CC%87%C5%9Fletme)
  - [Dolaylama](#dolaylama)
  - [Yer Değiştirme](#yer-de%C4%9Fi%C5%9Ftirme)
  - [Uzunluk](#uzunluk)
  - [Genişleme](#geni%C5%9Fleme)
  - [Büyük/Küçük Harf Değişimi](#b%C3%BCy%C3%BCkk%C3%BC%C3%A7%C3%BCk-harf-de%C4%9Fi%C5%9Fimi)
  - [Ön tanımlı değer](#%C3%B6n-tan%C4%B1ml%C4%B1-de%C4%9Fer)
- [ÇİFT GENİŞLETME](#%C3%A7i%CC%87ft-geni%CC%87%C5%9Fletme)
  - [Aralıklar](#aral%C4%B1klar)
  - [Metin Listeleri](#metin-listeleri)
- [KOŞULLU ANLATIMLAR](#ko%C5%9Fullu-anlatimlar)
  - [Dosya Koşulları](#dosya-ko%C5%9Fullar%C4%B1)
  - [Dosya Karşılaştırmaları](#dosya-kar%C5%9F%C4%B1la%C5%9Ft%C4%B1rmalar%C4%B1)
  - [Değişken Koşullamaları](#de%C4%9Fi%C5%9Fken-ko%C5%9Fullamalar%C4%B1)
  - [Değişken Karşılaştırmaları](#de%C4%9Fi%C5%9Fken-kar%C5%9F%C4%B1la%C5%9Ft%C4%B1rmalar%C4%B1)
- [ARİTMETİK OPERATÖRLER](#ari%CC%87tmeti%CC%87k-operat%C3%B6rler)
  - [Atama](#atama)
  - [Aritmetik](#aritmetik)
  - [Bit Tabanlı](#bit-tabanl%C4%B1)
  - [Mantık](#mant%C4%B1k)
  - [Çeşitli](#%C3%A7e%C5%9Fitli)
- [ARİTMETİK](#ari%CC%87tmeti%CC%87k)
  - [Değişkenleri ayarlamak için daha basit sözdizimi](#de%C4%9Fi%C5%9Fkenleri-ayarlamak-i%C3%A7in-daha-basit-s%C3%B6zdizimi)
  - [Üçlü Testler](#%C3%BC%C3%A7l%C3%BC-testler)
- [TUZAKLAR](#tuzaklar)
  - [Script çıkışında bir şey yap](#script-%C3%A7%C4%B1k%C4%B1%C5%9F%C4%B1nda-bir-%C5%9Fey-yap)
  - [Terminal kapanmasını yoksayma (CTRL+C, SIGINT)](#terminal-kapanmas%C4%B1n%C4%B1-yoksayma-ctrlc-sigint)
  - [Pencereyi boyutlandırılmasına tepki verme](#pencereyi-boyutland%C4%B1r%C4%B1lmas%C4%B1na-tepki-verme)
  - [Her komuttan önce bir şeyler yapma](#her-komuttan-%C3%B6nce-bir-%C5%9Feyler-yapma)
  - [Bir kabuk işlevi veya kaynak bir dosya yürütmeyi bitirdiğinde bir şey yapma](#bir-kabuk-i%C5%9Flevi-veya-kaynak-bir-dosya-y%C3%BCr%C3%BCtmeyi-bitirdi%C4%9Finde-bir-%C5%9Fey-yapma)
- [VERİM](#veri%CC%87m)
  - [Unicode'u devre dışı bırakma](#unicodeu-devre-d%C4%B1%C5%9F%C4%B1-b%C4%B1rakma)
- [ESKİMİŞ SÖZDİZİMİ](#eski%CC%87mi%CC%87%C5%9F-s%C3%B6zdi%CC%87zi%CC%87mi%CC%87)
  - [Shebang](#shebang)
  - [Komut Değiştirme](#komut-de%C4%9Fi%C5%9Ftirme)
  - [Fonksiyon Tanımlama](#fonksiyon-tan%C4%B1mlama)
- [İÇ DEĞİŞKENLER](#i%CC%87%C3%A7-de%C4%9Fi%CC%87%C5%9Fkenler)
  - [`bash` komutunun yerini bulma](#bash-komutunun-yerini-bulma)
  - [Geçerli çalışan `bash` işleminin sürümünü bulma](#ge%C3%A7erli-%C3%A7al%C4%B1%C5%9Fan-bash-i%C5%9Fleminin-s%C3%BCr%C3%BCm%C3%BCn%C3%BC-bulma)
  - [Kullanıcının tercih ettiği metin düzenleyicisini açma](#kullan%C4%B1c%C4%B1n%C4%B1n-tercih-etti%C4%9Fi-metin-d%C3%BCzenleyicisini-a%C3%A7ma)
  - [Mevcut fonksiyonun adını alma](#mevcut-fonksiyonun-ad%C4%B1n%C4%B1-alma)
  - [Sistemin ana bilgisayar adını alma](#sistemin-ana-bilgisayar-ad%C4%B1n%C4%B1-alma)
  - [İşletim Sisteminin mimarisinin adını bulma](#i%CC%87%C5%9Fletim-sisteminin-mimarisinin-ad%C4%B1n%C4%B1-bulma)
  - [İşletim Sistemi / Çekirdek adını alma](#i%CC%87%C5%9Fletim-sistemi--%C3%A7ekirdek-ad%C4%B1n%C4%B1-alma)
  - [Geçerli çalışma dizinini alma](#ge%C3%A7erli-%C3%A7al%C4%B1%C5%9Fma-dizinini-alma)
  - [Komut dosyasının çalıştığı saniye sayısını alma](#komut-dosyas%C4%B1n%C4%B1n-%C3%A7al%C4%B1%C5%9Ft%C4%B1%C4%9F%C4%B1-saniye-say%C4%B1s%C4%B1n%C4%B1-alma)
  - [Sahte bir tamsayı oluşturma](#sahte-bir-tamsay%C4%B1-olu%C5%9Fturma)
- [TERMİNAL HAKKINDA BİLGİLER](#termi%CC%87nal-hakkinda-bi%CC%87lgi%CC%87ler)
  - [Terminal boyutunu satırlar ve sütunlar halinde alma (*bir betikten*)](#terminal-boyutunu-sat%C4%B1rlar-ve-s%C3%BCtunlar-halinde-alma-bir-betikten)
  - [Terminal boyutunu piksel cinsinden alma](#terminal-boyutunu-piksel-cinsinden-alma)
  - [Mevcut imleç pozisyonunu alma](#mevcut-imle%C3%A7-pozisyonunu-alma)
- [DÖNÜŞTÜRMEK](#d%C3%B6n%C3%BC%C5%9Ft%C3%BCrmek)
  - [Hex rengi RGB'ye dönüştürme](#hex-rengi-rgbye-d%C3%B6n%C3%BC%C5%9Ft%C3%BCrme)
  - [RGB rengini hex'e dönüştürme](#rgb-rengini-hexe-d%C3%B6n%C3%BC%C5%9Ft%C3%BCrme)
- [KOD GOLFÜ](#kod-golf%C3%BC)
  - [Kısa `for` döngüsü sözdizimi](#k%C4%B1sa-for-d%C3%B6ng%C3%BCs%C3%BC-s%C3%B6zdizimi)
  - [Daha kısa sonsuz döngüler](#daha-k%C4%B1sa-sonsuz-d%C3%B6ng%C3%BCler)
  - [Daha kısa fonksiyon tanımlama](#daha-k%C4%B1sa-fonksiyon-tan%C4%B1mlama)
  - [Daha kısa `if` sözdizimi](#daha-k%C4%B1sa-if-s%C3%B6zdizimi)
  - [Değişkeni ayarlamak için basit `case` ifadesi](#de%C4%9Fi%C5%9Fkeni-ayarlamak-i%C3%A7in-basit-case-ifadesi)
- [DİĞER](#di%CC%87%C4%9Fer)
  - [`sleep` komutuna alternatif olarak `read` kullanma](#sleep-komutuna-alternatif-olarak-read-kullanma)
  - [Bir programın kullanıcının PATH'sinde olup olmadığını kontrol etme](#bir-program%C4%B1n-kullan%C4%B1c%C4%B1n%C4%B1n-pathsinde-olup-olmad%C4%B1%C4%9F%C4%B1n%C4%B1-kontrol-etme)
  - [`strftime` kullanarak geçerli tarihi alma](#strftime-kullanarak-ge%C3%A7erli-tarihi-alma)
  - [Mevcut kullanıcının kullanıcı adını alma](#mevcut-kullan%C4%B1c%C4%B1n%C4%B1n-kullan%C4%B1c%C4%B1-ad%C4%B1n%C4%B1-alma)
  - [Bir UUID V4 oluşturma](#bir-uuid-v4-olu%C5%9Fturma)
  - [İlerleme çubukları](#i%CC%87lerleme-%C3%A7ubuklar%C4%B1)
  - [Bir komut dosyasındaki işlevlerin listesini alma](#bir-komut-dosyas%C4%B1ndaki-i%C5%9Flevlerin-listesini-alma)
  - [Kabuktaki takma isimleri atlama](#kabuktaki-takma-isimleri-atlama)
  - [Kabuk fonksiyonları atlama](#kabuk-fonksiyonlar%C4%B1-atlama)
  - [Arka planda bir komut çalıştırma](#arka-planda-bir-komut-%C3%A7al%C4%B1%C5%9Ft%C4%B1rma)
- [SONSÖZ](#sons%C3%B6z)

<!-- vim-markdown-toc -->

<br>

<!-- CHAPTER START -->

# ÖNSÖZ

Dış süreçlere ve programlara saf `bash` alternatifleri topluluğu. `bash` script dili, insanların farkettiğinden daha güçlüdür ve çoğu görev harici programlara bağlı olmadan gerçekleştirilebilir.

`bash` olarak harici bir işlem yapılması pahalı ve aşırı kullanımda gözle görülür bir yavaşlamaya neden olur. Yerleşik yöntemler kullanılarak ( *varsa* ) yazılmış komut dosyaları ve programlar daha hızlı olacak, daha az bağımlılık gerektirecek ve dilin kendisini daha iyi anlayabilecektir.

Bu kitabın içeriği, programları ve komut dosyalarını `bash` yazarken karşılaşılan sorunların çözümü için bir referans sağlar. Örnekler, bu çözümlerin koda nasıl dahil edileceğini gösteren fonksiyon formatlarındadır.

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# METİNLER

## Metnin başında ve sonundaki boşlukları temizleme

Bu `sed` , `awk` , `perl` ve diğer araçlara bir alternatiftir.
Aşağıdaki fonksiyon tüm lider ve sondaki beyaz boşluğu bulup çalışır.
dizenin başlangıcından ve sonundan kaldırılıyor. Yerleşik `:` geçici bir değişken yerine kullanılır.

**Örnek Fonksiyon:**

```sh
trim_string() {
    # Usage: trim_string "   example   string    "
    : "${1#"${1%%[![:space:]]*}"}"
    : "${_%"${_##*[![:space:]]}"}"
    printf '%s\n' "$_"
}
```

**Örnek Kullanım:**

```shell
$ trim_string "    Hello,  World    "
Hello,  World

$ name="   John Black  "
$ trim_string "$name"
John Black
```

## Tüm fazla boşlukları kırpma

Bu `sed` , `awk` , `perl` ve diğer araçlara bir alternatiftir.
Aşağıdaki işlev, yeni bir dize oluşturmak için sözcük bölmeyi kötüye kullanarak çalışır
öndeki / sondaki beyaz boşluk olmadan ve kesik boşluklarla.

**Örnek Fonksiyon:**

```sh
# shellcheck disable=SC2086,SC2048
trim_all() {
    # Usage: trim_all "   example   string    "
    set -f
    set -- $*
    printf '%s\n' "$*"
    set +f
}
```

**Örnek Kullanım:**

```shell
$ trim_all "    Hello,    World    "
Hello, World

$ name="   John   Black  is     my    name.    "
$ trim_all "$name"
John Black is my name.
```

## Bir metinde regex kullanma

Çok sayıda durum için `bash`'in regex eşleştirme sonucu `sed` yerine kullanılabilir.

**UYARI** : Bu, platforma bağımlı birkaç `bash` özelliğinden biridir.
`bash` , kullanıcının sisteminde yüklü olan regex motorunu kullanır.
Uyumluluk amaçlanıyorsa POSIX regex özelliklerine bağlı kalın.

**UYARI** : Bu örnek yalnızca ilk eşleşen grubu yazdırır. 
Çoklu yakalama grupları kullanmak için bazı değişikliklere ihtiyaç vardır.

**Örnek Fonksiyon:**

```sh
regex() {
    # Usage: regex "string" "regex"
    [[ $1 =~ $2 ]] && printf '%s\n' "${BASH_REMATCH[1]}"
}
```

**Örnek Kullanım:**

```shell
$ # Trim leading white-space.
$ regex '    hello' '^\s*(.*)'
hello

$ # Validate a hex color.
$ regex "#FFFFFF" '^(#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3}))$'
#FFFFFF

$ # Validate a hex color (invalid).
$ regex "red" '^(#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3}))$'
# no output (invalid)
```

**Kodda Örnek Kullanım:**

```shell
is_hex_color() {
    if [[ $1 =~ ^(#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3}))$ ]]; then
        printf '%s\n' "${BASH_REMATCH[1]}"
    else
        printf '%s\n' "error: $1 is an invalid color."
        return 1
    fi
}

read -r color
is_hex_color "$color" || color="#FFFFFF"

# Do stuff.
```

## Bir sınırlayıcı ile metni bölme

**CAVEAT:** `bash` 4+ gerektirir

Bu `cut` , `awk` ve diğer araçlara bir alternatiftir.

**Örnek Fonksiyon:**

```sh
split() {
   # Usage: split "string" "delimiter"
   IFS=$'\n' read -d "" -ra arr <<< "${1//$2/$'\n'}"
   printf '%s\n' "${arr[@]}"
}
```

**Örnek Kullanım:**

```shell
$ split "apples,oranges,pears,grapes" ","
apples
oranges
pears
grapes

$ split "1, 2, 3, 4, 5" ", "
1
2
3
4
5

# Multi char delimiters work too!
$ split "hello---world---my---name---is---john" "---"
hello
world
my
name
is
john
```

## Bir metni küçük harfe dönüştürme

**CAVEAT:** `bash` 4+ gerektirir

**Örnek Fonksiyon:**

```sh
lower() {
    # Usage: lower "string"
    printf '%s\n' "${1,,}"
}
```

**Örnek Kullanım:**

```shell
$ lower "HELLO"
hello

$ lower "HeLlO"
hello

$ lower "hello"
hello
```

## Bir metni büyük harfe dönüştürme

**CAVEAT:** `bash` 4+ gerektirir

**Örnek Fonksiyon:**

```sh
upper() {
    # Usage: upper "string"
    printf '%s\n' "${1^^}"
}
```

**Örnek Kullanım:**

```shell
$ upper "hello"
HELLO

$ upper "HeLlO"
HELLO

$ upper "HELLO"
HELLO
```

## Metin harf büyüklüğünü ters çevirme

**CAVEAT:** `bash` 4+ gerektirir

**Örnek Fonksiyon:**

```sh
reverse_case() {
    # Usage: reverse_case "string"
    printf '%s\n' "${1~~}"
}
```

**Örnek Kullanım:**

```shell
$ reverse_case "hello"
HELLO

$ reverse_case "HeLlO"
hElLo

$ reverse_case "HELLO"
hello
```

## Metinden tırnakları kırpma

**Örnek Fonksiyon:**

```sh
trim_quotes() {
    # Usage: trim_quotes "string"
    : "${1//\'}"
    printf '%s\n' "${_//\"}"
}
```

**Örnek Kullanım:**

```shell
$ var="'Hello', \"World\""
$ trim_quotes "$var"
Hello, World
```

## Metindeki tüm desen örneklerini kırpma

**Örnek Fonksiyon:**

```sh
strip_all() {
    # Usage: strip_all "string" "pattern"
    printf '%s\n' "${1//$2}"
}
```

**Örnek Kullanım:**

```shell
$ strip_all "The Quick Brown Fox" "[aeiou]"
Th Qck Brwn Fx

$ strip_all "The Quick Brown Fox" "[[:space:]]"
TheQuickBrownFox

$ strip_all "The Quick Brown Fox" "Quick "
The Brown Fox
```

## Metinde bir desenin ilk örneğini kırpma

**Örnek Fonksiyon:**

```sh
strip() {
    # Usage: strip "string" "pattern"
    printf '%s\n' "${1/$2}"
}
```

**Örnek Kullanım:**

```shell
$ strip "The Quick Brown Fox" "[aeiou]"
Th Quick Brown Fox

$ strip "The Quick Brown Fox" "[[:space:]]"
TheQuick Brown Fox
```

## Metnin başındaki bir deseni kırpma

**Örnek Fonksiyon:**

```sh
lstrip() {
    # Usage: lstrip "string" "pattern"
    printf '%s\n' "${1##$2}"
}
```

**Örnek Kullanım:**

```shell
$ lstrip "The Quick Brown Fox" "The "
Quick Brown Fox
```

## Metnin sonundaki bir deseni kırpma

**Örnek Fonksiyon:**

```sh
rstrip() {
    # Usage: rstrip "string" "pattern"
    printf '%s\n' "${1%%$2}"
}
```

**Örnek Kullanım:**

```shell
$ rstrip "The Quick Brown Fox" " Fox"
The Quick Brown
```

## Bir metnin percent-encode çevirimini yapma

**Örnek Fonksiyon:**

```sh
urlencode() {
    # Usage: urlencode "string"
    local LC_ALL=C
    for (( i = 0; i < ${#1}; i++ )); do
        : "${1:i:1}"
        case "$_" in
            [a-zA-Z0-9.~_-])
                printf '%s' "$_"
            ;;

            *)
                printf '%%%02X' "'$_"
            ;;
        esac
    done
    printf '\n'
}
```

**Örnek Kullanım:**

```shell
$ urlencode "https://github.com/dylanaraps/pure-bash-bible"
https%3A%2F%2Fgithub.com%2Fdylanaraps%2Fpure-bash-bible
```

## Bir metnin percent-encode geri çevirimini yapma

**Örnek Fonksiyon:**

```sh
urldecode() {
    # Usage: urldecode "string"
    : "${1//+/ }"
    printf '%b\n' "${_//%/\\x}"
}
```

**Örnek Kullanım:**

```shell
$ urldecode "https%3A%2F%2Fgithub.com%2Fdylanaraps%2Fpure-bash-bible"
https://github.com/dylanaraps/pure-bash-bible
```

## Metnin bir alt metni içerip içermediğini kontrol etme

**Bir test kullanmak:**

```shell
if [[ $var == *sub_string* ]]; then
    printf '%s\n' "sub_string is in var."
fi

# Inverse (substring not in string).
if [[ $var != *sub_string* ]]; then
    printf '%s\n' "sub_string is not in var."
fi

# This works for arrays too!
if [[ ${arr[*]} == *sub_string* ]]; then
    printf '%s\n' "sub_string is in array."
fi
```

**Bir case ifadesi kullanarak:**

```shell
case "$var" in
    *sub_string*)
        # Do stuff
    ;;

    *sub_string2*)
        # Do more stuff
    ;;

    *)
        # Else
    ;;
esac
```

## Metnin bir alt metinle başlayıp başlamadığını kontrol etme

```shell
if [[ $var == sub_string* ]]; then
    printf '%s\n' "var starts with sub_string."
fi

# Inverse (var does not start with sub_string).
if [[ $var != sub_string* ]]; then
    printf '%s\n' "var does not start with sub_string."
fi
```

## Metnin bir alt metinle bitip bitmediğini kontrol etme

```shell
if [[ $var == *sub_string ]]; then
    printf '%s\n' "var ends with sub_string."
fi

# Inverse (var does not end with sub_string).
if [[ $var != *sub_string ]]; then
    printf '%s\n' "var does not end with sub_string."
fi
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# DİZİLER

## Diziyi ters çevirme

`extdebug`'ı etkinleştirmek, geçerli fonksiyonun argümanlarını ters sırada saklayan `BASH_ARGV` dizisine erişime izin verir.

**UYARI** : `bash` 5.0+ içinde `shopt -s compat44` gerektirir.

**Örnek Fonksiyon:**

```sh
reverse_array() {
    # Usage: reverse_array "array"
    shopt -s extdebug
    f()(printf '%s\n' "${BASH_ARGV[@]}"); f "$@"
    shopt -u extdebug
}
```

**Örnek Kullanım:**

```shell
$ reverse_array 1 2 3 4 5
5
4
3
2
1

$ arr=(red blue green)
$ reverse_array "${arr[@]}"
green
blue
red
```

## Yinelenen dizi öğelerini kaldırma

Geçici bir ilişkisel dizi oluşturun. İlişkisel dizi ayarlarken
değerleri ve yinelenen bir atama oluşur, bash anahtarın üzerine yazar. Bu
dizi kopyalarını etkin bir şekilde silmemize izin verir.

**CAVEAT:** `bash` 4+ gerektirir

**CAVEAT:** Liste sırası aynı kalmayabilir.

**Örnek Fonksiyon:**

```sh
remove_array_dups() {
    # Usage: remove_array_dups "array"
    declare -A tmp_array

    for i in "$@"; do
        [[ $i ]] && IFS=" " tmp_array["${i:- }"]=1
    done

    printf '%s\n' "${!tmp_array[@]}"
}
```

**Örnek Kullanım:**

```shell
$ remove_array_dups 1 1 2 2 3 3 3 3 3 4 4 4 4 4 5 5 5 5 5 5
1
2
3
4
5

$ arr=(red red green blue blue)
$ remove_array_dups "${arr[@]}"
red
green
blue
```

## Rasgele dizi elemanı

**Örnek Fonksiyon:**

```sh
random_array_element() {
    # Usage: random_array_element "array"
    local arr=("$@")
    printf '%s\n' "${arr[RANDOM % $#]}"
}
```

**Örnek Kullanım:**

```shell
$ array=(red green blue yellow brown)
$ random_array_element "${array[@]}"
yellow

# Multiple arguments can also be passed.
$ random_array_element 1 2 3 4 5 6 7
3
```

## Bir dizi içerisinde dolaşma

`printf` her çağrıldığında, bir sonraki dizi elemanı yazdırılır. Ne zaman son dizi elemanına isabet eder, o zaman tekrar ilk elamandan başlar.

```sh
arr=(a b c d)

cycle() {
    printf '%s ' "${arr[${i:=0}]}"
    ((i=i>=${#arr[@]}-1?0:++i))
}
```

## İki değer arasında geçiş yapma

Bu yukarıdakiyle aynı şekilde çalışır, bu sadece farklı bir kullanım durumudur.

```sh
arr=(true false)

cycle() {
    printf '%s ' "${arr[${i:=0}]}"
    ((i=i>=${#arr[@]}-1?0:++i))
}
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# DÖNGÜLER

## Bir sayı aralığında döngü

`seq` komutuna bir alternatiftir.

```shell
# Loop from 0-100 (no variable support).
for i in {0..100}; do
    printf '%s\n' "$i"
done
```

## Değişken sayı aralığında döngü

`seq` komutuna bir alternatiftir.

```shell
# Loop from 0-VAR.
VAR=50
for ((i=0;i<=VAR;i++)); do
    printf '%s\n' "$i"
done
```

## Bir dizi içinde döngü

```shell
arr=(apples oranges tomatoes)

# Just elements.
for element in "${arr[@]}"; do
    printf '%s\n' "$element"
done
```

## Dizinli bir dizi içinde döngü

```shell
arr=(apples oranges tomatoes)

# Elements and index.
for i in "${!arr[@]}"; do
    printf '%s\n' "${arr[i]}"
done

# Alternative method.
for ((i=0;i<${#arr[@]};i++)); do
    printf '%s\n' "${arr[i]}"
done
```

## Bir dosyanın içeriği içinde döngü

```shell
while read -r line; do
    printf '%s\n' "$line"
done < "file"
```

## Dosyalar ve dizinler içinde döngü

`ls` kullanma.

```shell
# Greedy example.
for file in *; do
    printf '%s\n' "$file"
done

# PNG files in dir.
for file in ~/Pictures/*.png; do
    printf '%s\n' "$file"
done

# Iterate over directories.
for dir in ~/Downloads/*/; do
    printf '%s\n' "$dir"
done

# Brace Expansion.
for file in /path/to/parentdir/{file1,file2,subdir/file3}; do
    printf '%s\n' "$file"
done

# Iterate recursively.
shopt -s globstar
for file in ~/Pictures/**/*; do
    printf '%s\n' "$file"
done
shopt -u globstar
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# DOSYA YÖNETİMİ

**CAVEAT:** `bash` , `< 4.4` sürümlerinde ikili verileri düzgün **işlemiyor** .

## Bir dosya içeriğini metin değişkenine dönüştürme

`cat` komutuna alternatif.

```shell
file_data="$(<"file")"
```

## Dosya içeriğini diziye dönüştürme ( *satır satır* )

`cat` komutuna alternatif.

```shell
# Bash <4 (discarding empty lines).
IFS=$'\n' read -d "" -ra file_data < "file"

# Bash <4 (preserving empty lines).
while read -r line; do
    file_data+=("$line")
done < "file"

# Bash 4+
mapfile -t file_data < "file"
```

## Bir dosyanın ilk N satırını alma

`head` komutuna alternatif.

**CAVEAT:** `bash` 4+ gerektirir

**Örnek Fonksiyon:**

```sh
head() {
    # Usage: head "n" "file"
    mapfile -tn "$1" line < "$2"
    printf '%s\n' "${line[@]}"
}
```

**Örnek Kullanım:**

```shell
$ head 2 ~/.bashrc
# Prompt
PS1='➜ '

$ head 1 ~/.bashrc
# Prompt
```

## Bir dosyanın son N satırını alma

`tail` komutuna alternatif.

**CAVEAT:** `bash` 4+ gerektirir

**Örnek Fonksiyon:**

```sh
tail() {
    # Usage: tail "n" "file"
    mapfile -tn 0 line < "$2"
    printf '%s\n' "${line[@]: -$1}"
}
```

**Örnek Kullanım:**

```shell
$ tail 2 ~/.bashrc
# Enable tmux.
# [[ -z "$TMUX"  ]] && exec tmux

$ tail 1 ~/.bashrc
# [[ -z "$TMUX"  ]] && exec tmux
```

## Bir dosyadaki satır sayısını alma

`wc -l` komutuna alternatif.

**Örnek İşlev (bash 4):**

```sh
lines() {
    # Usage: lines "file"
    mapfile -tn 0 lines < "$1"
    printf '%s\n' "${#lines[@]}"
}
```

**Örnek İşlev (bash 3):**

Bu yöntem `mapfile` yönteminden daha az bellek kullanır ve `bash` 3'te çalışır ancak büyük dosyalar için daha yavaştır.

```sh
lines_loop() {
    # Usage: lines_loop "file"
    count=0
    while IFS= read -r _; do
        ((count++))
    done < "$1"
    printf '%s\n' "$count"
}
```

**Örnek Kullanım:**

```shell
$ lines ~/.bashrc
48

$ lines_loop ~/.bashrc
48
```

## Dizindeki dosyaları veya dizinleri sayma

Bu, işlevin çıktısını işleve iletip argüman sayısını sayarak çalışır.

**Örnek Fonksiyon:**

```sh
count() {
    # Usage: count /path/to/dir/*
    #        count /path/to/dir/*/
    printf '%s\n' "$#"
}
```

**Örnek Kullanım:**

```shell
# Count all files in dir.
$ count ~/Downloads/*
232

# Count all dirs in dir.
$ count ~/Downloads/*/
45

# Count all jpg files in dir.
$ count ~/Pictures/*.jpg
64
```

## Boş bir dosya oluşturma

`touch` komutuna alternatif.

```shell
# Shortest.
>file

# Longer alternatives:
:>file
echo -n >file
printf '' >file
```

## İki işaret arasındaki satırları ayıklama

**Örnek Fonksiyon:**

```sh
extract() {
    # Usage: extract file "opening marker" "closing marker"
    while IFS=$'\n' read -r line; do
        [[ $extract && $line != "$3" ]] &&
            printf '%s\n' "$line"

        [[ $line == "$2" ]] && extract=1
        [[ $line == "$3" ]] && extract=
    done < "$1"
}
```

**Örnek Kullanım:**

```shell
# Extract code blocks from MarkDown file.
$ extract ~/projects/pure-bash/README.md '```sh' '```'
# Output here...
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# DOSYA YOLLARI

## Bir dosya yolunun dizin adını alma

`dirname` komutuna alternatif.

**Örnek Fonksiyon:**

```sh
dirname() {
    # Usage: dirname "path"
    local tmp=${1:-.}

    [[ $tmp != *[!/]* ]] && {
        printf '/\n'
        return
    }

    tmp=${tmp%%"${tmp##*[!/]}"}

    [[ $tmp != */* ]] && {
        printf '.\n'
        return
    }

    tmp=${tmp%/*}
    tmp=${tmp%%"${tmp##*[!/]}"}

    printf '%s\n' "${tmp:-/}"
}
```

**Örnek Kullanım:**

```shell
$ dirname ~/Pictures/Wallpapers/1.jpg
/home/black/Pictures/Wallpapers

$ dirname ~/Pictures/Downloads/
/home/black/Pictures
```

## Bir dosya yolunun taban adını alma

`basename` komutuna alternatif.

**Örnek Fonksiyon:**

```sh
basename() {
    # Usage: basename "path" ["suffix"]
    local tmp

    tmp=${1%"${1##*[!/]}"}
    tmp=${tmp##*/}
    tmp=${tmp%"${2/"$tmp"}"}

    printf '%s\n' "${tmp:-/}"
}
```

**Örnek Kullanım:**

```shell
$ basename ~/Pictures/Wallpapers/1.jpg
1.jpg

$ basename ~/Pictures/Wallpapers/1.jpg .jpg
1

$ basename ~/Pictures/Downloads/
Downloads
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# DEĞİŞKENLER

## Bir değişkeni kullanarak bir değişken atama ve erişme

```shell
$ hello_world="value"

# Create the variable name.
$ var="world"
$ ref="hello_$var"

# Print the value of the variable name stored in 'hello_$var'.
$ printf '%s\n' "${!ref}"
value
```

Alternatif olarak, `bash` 4.3+ üzerinde:

```shell
$ hello_world="value"
$ var="world"

# Declare a nameref.
$ declare -n ref=hello_$var

$ printf '%s\n' "$ref"
value
```

## Başka bir değişkeni temel alan bir değişken adı

```shell
$ var="world"
$ declare "hello_$var=value"
$ printf '%s\n' "$hello_world"
value
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# KIRPMA SERİLERİ

Popüler inanışın aksine, ham kırpma serilerinin kullanılmasında bir sorun yoktur. `tput`, manuel olarak yazdırılan ile aynı ANSI serilerini soyutlar. Daha da kötüsü, `tput` aslında taşınabilir değil. Her biri farklı komut ve sözdüzümüne sahip bir dizi `tput` varyasyonu vardır (*FreeBSD sisteminde `tput setaf 3` deneyin*). Ham dizileri kullanmak iyidir.

## Metin Renkleri

**NOT:** RGB değerleri gerektiren diziler sadece Gerçek Renkli Terminal Emülatörlerinde çalışır.

Seri | Bu ne işe yarıyor? | Değer, kıymet
--- | --- | ---
`\e[38;5;<NUM>m` | Metin ön plan rengini ayarlar. | `0-255`
`\e[48;5;<NUM>m` | Metin arka plan rengini ayarlar. | `0-255`
`\e[38;2;<R>;<G>;<B>m` | Metin ön plan rengini RGB renk olarak ayarlar. | `R`, `G`, `B`
`\e[48;2;<R>;<G>;<B>m` | Metin arka plan rengini RGB rengine ayarlar. | `R`, `G`, `B`

## Metin Nitelikleri

**NOT:** Etkisini kapatmak için aşağıdaki herhangi bir koda 2 bağımlı tutun
(örnekler: 21 = kalın metin kapalı, 22 = soluk metin kapalı, 23 = italik metin kapalı).

Sıra | Bu ne işe yarıyor?
--- | ---
`\e[m` | Metin biçimlendirmesini ve renkleri sıfırla.
`\e[1m` | Kalın yazı.
`\e[2m` | Soluk metin
`\e[3m` | Eğik yazı.
`\e[4m` | Metnin altını çiz.
`\e[5m` | Yanıp sönen metin
`\e[7m` | Vurgulanan metin
`\e[8m` | Gizli metin
`\e[9m` | Üstü çizili metin.

## İmleç Hareketi

Sıra | Bu ne işe yarıyor? | Değer, kıymet
--- | --- | ---
`\e[<LINE>;<COLUMN>H` | İmleci mutlak konuma getirir. | `line`, `column`
`\e[H` | İmleci başlangıç konumuna getirir ( `0,0` ). | 
`\e[<NUM>A` | İmleci N satır yukarı kaydır. | `num`
`\e[<NUM>B` | İmleci N satır aşağı hareket ettirir. | `num`
`\e[<NUM>C` | İmleci sağ N sütununa getirir. | `num`
`\e[<NUM>D` | İmleci N sütunlarına getirir. | `num`
`\e[s` | İmleç konumunu kaydeder. | 
`\e[u` | İmleç konumunu geri yükler. | 

## Metin Silme

Seri | Bu ne işe yarıyor?
--- | ---
`\e[K` | İmleç konumundan satırın sonuna kadar siler.
`\e[1K` | Satırın başına imleç konumundan siler.
`\e[2K` | Geçerli çizginin tamamını siler.
`\e[J` | Geçerli satırdan ekranın altına doğru siler.
`\e[1J` | Geçerli satırdan ekranın üstüne siler.
`\e[2J` | Ekranı temizler.
`\e[2J\e[H` | Ekranı temizleyin ve imleci `0,0` getirir.

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# PARAMETRE GENİŞLETME

## Dolaylama

Parametre | Bu ne işe yarıyor?
--- | ---
`${!VAR}` | `VAR` değerini temel alarak bir değişkene erişin.
`${!VAR*}` | `VAR` ile başlayan değişken isimlerinin `IFS` ayrılmış listesine genişletin.
`${!VAR@}` | `VAR` ile başlayan değişken isimlerinin `IFS` ayrılmış listesine genişletin. Çift tırnak işaretli ise, her değişken ismi ayrı bir kelimeye genişler.

## Yer Değiştirme

Parametre | Bu ne işe yarıyor?
--- | ---
`${VAR#PATTERN}` | Dizenin en başındaki model eşleşmesini kaldırın.
`${VAR##PATTERN}` | Dizenin başındaki en uzun desen eşleşmesini kaldırın.
`${VAR%PATTERN}` | En kısa desen eşleşmesini dizenin sonundan kaldırın.
`${VAR%%PATTERN}` | Dizenin en uzun desen eşleşmesini kaldırın.
`${VAR/PATTERN/REPLACE}` | İlk eşleşmeyi dizeyle değiştir.
`${VAR//PATTERN/REPLACE}` | Tüm eşleşmeleri dizeyle değiştir.
`${VAR/PATTERN}` | İlk eşleşmeyi kaldır.
`${VAR//PATTERN}` | Tüm eşleşmeleri kaldır.

## Uzunluk

Parametre | Bu ne işe yarıyor?
--- | ---
`${#VAR}` | Karakter cinsinden değişkenin uzunluğu.
`${#ARR[@]}` | Dizideki elemanların uzunluğu.

## Genişleme

Parametre | Bu ne işe yarıyor?
--- | ---
`${VAR:OFFSET}` | İlk `N` karakterini değişkenden kaldırır.
`${VAR:OFFSET:LENGTH}` | `N` karakterinden başlayarak `N` karakter alt dizi alır. <br> ( `${VAR:10:10}` : `10` karakterden `20` karaktere kadar alt dizgiyi alır)
`${VAR:: OFFSET}` | Değişkenden ilk `N` karakteri alır.
`${VAR:: -OFFSET}` | Değişkenden son `N` karakteri çıkarır.
`${VAR: -OFFSET}` | Değişkenden son `N` karakteri alır.
`${VAR:OFFSET:-OFFSET}` | İlk `N` karakterini ve son `N` karakterini keser.

## Büyük/Küçük Harf Değişimi

Parametre | Bu ne işe yarıyor? | UYARI
--- | --- | ---
`${VAR^}` | İlk karakteri büyük harf yapar. | `bash 4+`
`${VAR^^}` | Tüm karakterleri büyük harf yapar. | `bash 4+`
`${VAR,}` | İlk karakteri küçük harf yapar. | `bash 4+`
`${VAR,,}` | Tüm karakterleri küçük harf yapar. | `bash 4+`
`${VAR~}` | İlk karakteri tersi duruma çevirir. | `bash 4+`
`${VAR~~}` | Tüm karakterleri tersi duruma çevirir. | `bash 4+`

## Ön tanımlı değer

Parametre | Bu ne işe yarıyor?
--- | ---
`${VAR:-STRING}` | `VAR` boş veya ayarlanmamışsa, değeri `STRING` olarak kullanın.
`${VAR-STRING}` | `VAR` ayarlanmamışsa, değeri `STRING` olarak kullanın.
`${VAR:=STRING}` | `VAR` boş veya ayarlanmamışsa, `VAR` değerini `STRING` .
`${VAR=STRING}` | `VAR` ayarlanmamışsa, `VAR` değerini `STRING` .
`${VAR:+STRING}` | `VAR` boş değilse, `STRING` değerini değer olarak kullanın.
`${VAR+STRING}` | `VAR` ayarlanmışsa, değeri `STRING` kullanın.
`${VAR:?STRING}` | Boş veya ayarlanmamışsa bir hata göster.
`${VAR?STRING}` | Ayarlanmamışsa bir hata göster.

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# ÇİFT GENİŞLETME

## Aralıklar

```shell
# Syntax: {<START>..<END>}

# Print numbers 1-100.
echo {1..100}

# Print range of floats.
echo 1.{1..9}

# Print chars a-z.
echo {a..z}
echo {A..Z}

# Nesting.
echo {A..Z}{0..9}

# Print zero-padded numbers.
# CAVEAT: bash 4+
echo {01..100}

# Change increment amount.
# Syntax: {<START>..<END>..<INCREMENT>}
# CAVEAT: bash 4+
echo {1..10..2} # Increment by 2.
```

## Metin Listeleri

```shell
echo {apples,oranges,pears,grapes}

# Example Usage:
# Remove dirs Movies, Music and ISOS from ~/Downloads/.
rm -rf ~/Downloads/{Movies,Music,ISOS}
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# KOŞULLU ANLATIMLAR

## Dosya Koşulları

ifade | Değer, kıymet | Bu ne işe yarıyor?
--- | --- | ---
`-a` | `file` | Dosya varsa.
`-b` | `file` | Dosya varsa ve bir blok özel dosya ise.
`-c` | `file` | Dosya varsa ve karakter özel bir dosyaysa.
`-d` | `file` | Dosya varsa ve bir dizin ise.
`-e` | `file` | Dosya varsa.
`-f` | `file` | Dosya varsa ve normal bir dosyadır.
`-g` | `file` | Dosya varsa ve set-id grubu biti ayarlanır.
`-h` | `file` | Dosya varsa ve sembolik bir bağ.
`-k` | `file` | Dosya varsa ve yapışkan biti ayarlanmışsa
`-p` | `file` | Dosya varsa ve adlandırılmış bir boru ise ( *FIFO* ).
`-r` | `file` | Dosya varsa ve okunabilirse.
`-s` | `file` | Dosya varsa ve boyutu sıfırdan büyükse.
`-t` | `fd` | Dosya tanıtıcısı açıksa ve bir terminale başvuruyorsa.
`-u` | `file` | Dosya varsa ve kullanıcı kimliği biti ayarlanmışsa.
`-w` | `file` | Dosya varsa ve yazılabilir ise.
`-x` | `file` | Dosya varsa ve çalıştırılabilirse.
`-G` | `file` | Dosya varsa ve etkin grup kimliği aittir.
`-L` | `file` | Dosya varsa ve sembolik bir bağ.
`-N` | `file` | Dosya varsa ve son okunduğundan beri değiştirilmişse.
`-O` | `file` | Dosya varsa ve etkin kullanıcı kimliğine aittir.
`-S` | `file` | Dosya varsa ve bir soket ise.

## Dosya Karşılaştırmaları

ifade | Bu ne işe yarıyor?
--- | ---
`file -ef file2` | Her iki dosya da aynı inode ve cihaz numaralarına bakın.
`file -nt file2` | `file` `file2` daha yeni ise ( *değişiklik zamanı kullanır* ) veya `file` varsa ve `file2` gelmez.
`file -ot file2` | `file` `file2` daha eskiyse ( *değişiklik zamanını kullanır* ) veya `file2` varsa ve `file` yok.

## Değişken Koşullamaları

ifade | Değer | Bu ne işe yarıyor?
--- | --- | ---
`-o` | `opt` | Kabuk seçeneği etkinse.
`-v` | `var` | Değişken atanmış bir değere sahipse.
`-R` | `var` | Değişken bir isim referans ise.
`-z` | `var` | Dize uzunluğu sıfır ise.
`-n` | `var` | Dize uzunluğu sıfır değilse.

## Değişken Karşılaştırmaları

ifade | Bu ne işe yarıyor?
--- | ---
`var = var2` | Eşittir.
`var == var2` | Eşittir (* `=` ile eş anlamlı *).
`var != var2` | Eşit değil.
`var < var2` | Şundan küçük ( *ASCII alfabetik sırayla* )
`var > var2` | Şundan büyük ( *ASCII alfabetik sırayla* )

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# ARİTMETİK OPERATÖRLER

## Atama

Operatörler | Bu ne işe yarıyor?
--- | ---
`=` | Bir değişkenin değerini sıfırlayın veya değiştirin.

## Aritmetik

Operatörler | Bu ne işe yarıyor?
--- | ---
`+` | İlave
`-` | Çıkarma
`*` | Çarpma işlemi
`/` | Bölünme
`**` | Üs
`%` | Modülo
`+=` | Artı-Eşit ( *Bir değişkenin arttırılması.* )
`-=` | Eksi-Eşit ( *Değişken azalması.* )
`*=` | Times-Equal ( *Bir değişkeni çarpın.* )
`/=` | Slash-Equal ( *Bir değişkeni böl.* )
`%=` | Mod-Equal ( *Bir değişkeni bölmenin kalanı.* )

## Bit Tabanlı

Operatörler | Bu ne işe yarıyor?
--- | ---
`<<` | Bit Tabanlı Sola Kaydırma
`<<=` | Sol-Shift-Eşit
`>>` | Bit Tabanlı Sağa Kaydırma
`>>=` | Sağ-Shift-Eşit
`&` | Bit tabanlı AND
`&=` | Bit tabanlı AND-Equal
`|` | Bit tabanlı OR
`|=` | Bit tabanlı OR-Equal
`~` | Bit tabanlı NOT
`^` | Bit tabanlı XOR
`^=` | Bit tabanlı XOR-Equal

## Mantık

Operatörler | Bu ne işe yarıyor?
--- | ---
`!` | DEĞİL
`&&` | VE
`||` | VEYA

## Çeşitli

Operatörler | Bu ne işe yarıyor? | Örnek
--- | --- | ---
`,` | Virgül ayırıcı | `((a=1,b=2,c=3))`

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# ARİTMETİK

## Değişkenleri ayarlamak için daha basit sözdizimi

```shell
# Simple math
((var=1+2))

# Decrement/Increment variable
((var++))
((var--))
((var+=1))
((var-=1))

# Using variables
((var=var2*arr[2]))
```

## Üçlü Testler

```shell
# Set the value of var to var2 if var2 is greater than var.
# var: variable to set.
# var2>var: Condition to test.
# ?var2: If the test succeeds.
# :var: If the test fails.
((var=var2>var?var2:var))
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# TUZAKLAR

Tuzaklar (Trap) bir komut dosyasının çeşitli sinyallerde kod çalıştırmasına izin verir. [Pxltrm'de](https://github.com/dylanaraps/pxltrm) ( *bash ile yazılmış bir piksel sanat editörü* ) tuzaklar, pencereyi yeniden boyutlandırmadaki kullanıcı arayüzünü yeniden çizmek için kullanılır. Diğer bir kullanım senaryosu, komut dosyası çıkışındaki geçici dosyaları temizlemektir.

Tuzaklar, komut dosyalarının başlangıcına yakın olarak eklenmelidir, böylece erken hatalar da yakalanır.

**NOT:** Sinyallerin tam listesi için, `trap -l` bakın.

## Script çıkışında bir şey yap

```shell
# Clear screen on script exit.
trap 'printf \\e[2J\\e[H\\e[m' EXIT
```

## Terminal kapanmasını yoksayma (CTRL+C, SIGINT)

```shell
trap '' INT
```

## Pencereyi boyutlandırılmasına tepki verme

```shell
# Call a function on window resize.
trap 'code_here' SIGWINCH
```

## Her komuttan önce bir şeyler yapma

```shell
trap 'code_here' DEBUG
```

## Bir kabuk işlevi veya kaynak bir dosya yürütmeyi bitirdiğinde bir şey yapma

```shell
trap 'code_here' RETURN
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# VERİM

## Unicode'u devre dışı bırakma

Unicode gerekli değilse, performans artışı için devre dışı bırakılabilir. Sonuçlar değişebilir ancak [neofetch](https://github.com/dylanaraps/neofetch) ve diğer programlarda gözle görülür gelişmeler oldu.

```shell
# Disable unicode.
LC_ALL=C
LANG=C
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# ESKİMİŞ SÖZDİZİMİ

## Shebang

Kullanım `#!/usr/bin/env bash` yerine `#!/bin/bash` .

- Önceki `bash`'ini bulmak için kullanıcının `PATH`'inde arama yapar.
- İkincisi, her zaman `/bin/` altında olduğunu varsaya ve bunun sorunlara yol açabileceğini unutmayın.

**NOT** : `#!/bin/bash` veya ikili başka bir doğrudan yol kullanmak için iyi bir neden olabileceği zamanlar olabilir.

```shell
# Right:

    #!/usr/bin/env bash

# Less right:

    #!/bin/bash
```

## Komut Değiştirme

`` `` Yerine `$()` kullanın.

```shell
# Right.
var="$(command)"

# Wrong.
var=`command`

# $() can easily be nested whereas `` cannot.
var="$(command "$(command)")"
```

## Fonksiyon Tanımlama

`function` anahtar sözcüğünü kullanmayın, `bash` eski sürümleriyle uyumluluğu azaltır.

```shell
# Right.
do_something() {
    # ...
}

# Wrong.
function do_something() {
    # ...
}
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# İÇ DEĞİŞKENLER

## `bash` komutunun yerini bulma

```shell
"$BASH"
```

## Geçerli çalışan `bash` işleminin sürümünü bulma

```shell
# As a string.
"$BASH_VERSION"

# As an array.
"${BASH_VERSINFO[@]}"
```

## Kullanıcının tercih ettiği metin düzenleyicisini açma

```shell
"$EDITOR" "$file"

# NOTE: This variable may be empty, set a fallback value.
"${EDITOR:-vi}" "$file"
```

## Mevcut fonksiyonun adını alma

```shell
# Current function.
"${FUNCNAME[0]}"

# Parent function.
"${FUNCNAME[1]}"

# So on and so forth.
"${FUNCNAME[2]}"
"${FUNCNAME[3]}"

# All functions including parents.
"${FUNCNAME[@]}"
```

## Sistemin ana bilgisayar adını alma

```shell
"$HOSTNAME"

# NOTE: This variable may be empty.
# Optionally set a fallback to the hostname command.
"${HOSTNAME:-$(hostname)}"
```

## İşletim Sisteminin mimarisinin adını bulma

```shell
"$HOSTTYPE"
```

## İşletim Sistemi / Çekirdek adını alma

Bu, `uname` çağırmaya gerek duyma farklı işletim sistemldaneri için koşullu destek eklemekte kullanılabilir.

```shell
"$OSTYPE"
```

## Geçerli çalışma dizinini alma

Bu, dahili `pwd` bir alternatiftir.

```shell
"$PWD"
```

## Komut dosyasının çalıştığı saniye sayısını alma

```shell
"$SECONDS"
```

## Sahte bir tamsayı oluşturma

`$RANDOM` her kullanıldığında, `0` ile `32767` arasında farklı bir tam sayı döndürür. Bu değişken güvenlikle ilgili hiçbir şey için kullanılmamalıdır (*bu şifreleme anahtarlarını* vb içerir).

```shell
"$RANDOM"
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# TERMİNAL HAKKINDA BİLGİLER

## Terminal boyutunu satırlar ve sütunlar halinde alma (*bir betikten*)

`stty`/{code2}tput{/code2} kullanılmadan saf bash yazarken kullanışlıdır.

**Örnek Fonksiyon:**

```sh
get_term_size() {
    # Usage: get_term_size

    # (:;:) is a micro sleep to ensure the variables are
    # exported immediately.
    shopt -s checkwinsize; (:;:)
    printf '%s\n' "$LINES $COLUMNS"
}
```

**Örnek Kullanım:**

```shell
# Output: LINES COLUMNS
$ get_term_size
15 55
```

## Terminal boyutunu piksel cinsinden alma

**UYARI** : Bu, bazı terminal emülatörlerinde çalışmaz.

**Örnek Fonksiyon:**

```sh
get_window_size() {
    # Usage: get_window_size
    printf '%b' "${TMUX:+\\ePtmux;\\e}\\e[14t${TMUX:+\\e\\\\}"
    IFS=';t' read -d t -t 0.05 -sra term_size
    printf '%s\n' "${term_size[1]}x${term_size[2]}"
}
```

**Örnek Kullanım:**

```shell
# Output: WIDTHxHEIGHT
$ get_window_size
1200x800

# Output (fail):
$ get_window_size
x
```

## Mevcut imleç pozisyonunu alma

Bu, saf bash'te bir TUI oluştururken kullanışlıdır.

**Örnek Fonksiyon:**

```sh
get_cursor_pos() {
    # Usage: get_cursor_pos
    IFS='[;' read -p $'\e[6n' -d R -rs _ y x _
    printf '%s\n' "$x $y"
}
```

**Örnek Kullanım:**

```shell
# Output: X Y
$ get_cursor_pos
1 8
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# DÖNÜŞTÜRMEK

## Hex rengi RGB'ye dönüştürme

**Örnek Fonksiyon:**

```sh
hex_to_rgb() {
    # Usage: hex_to_rgb "#FFFFFF"
    #        hex_to_rgb "000000"
    : "${1/\#}"
    ((r=16#${_:0:2},g=16#${_:2:2},b=16#${_:4:2}))
    printf '%s\n' "$r $g $b"
}
```

**Örnek Kullanım:**

```shell
$ hex_to_rgb "#FFFFFF"
255 255 255
```

## RGB rengini hex'e dönüştürme

**Örnek Fonksiyon:**

```sh
rgb_to_hex() {
    # Usage: rgb_to_hex "r" "g" "b"
    printf '#%02x%02x%02x\n' "$1" "$2" "$3"
}
```

**Örnek Kullanım:**

```shell
$ rgb_to_hex "255" "255" "255"
#FFFFFF
```

# KOD GOLFÜ

## Kısa `for` döngüsü sözdizimi

```shell
# Tiny C Style.
for((;i++<10;)){ echo "$i";}

# Undocumented method.
for i in {1..10};{ echo "$i";}

# Expansion.
for i in {1..10}; do echo "$i"; done

# C Style.
for((i=0;i<=10;i++)); do echo "$i"; done
```

## Daha kısa sonsuz döngüler

```shell
# Normal method
while :; do echo hi; done

# Shorter
for((;;)){ echo hi;}
```

## Daha kısa fonksiyon tanımlama

```shell
# Normal method
f(){ echo hi;}

# Using a subshell
f()(echo hi)

# Using arithmetic
# This can be used to assign integer values.
# Example: f a=1
#          f a++
f()(($1))

# Using tests, loops etc.
# NOTE: ‘while’, ‘until’, ‘case’, ‘(())’, ‘[[]]’ can also be used.
f()if true; then echo "$1"; fi
f()for i in "$@"; do echo "$i"; done
```

## Daha kısa `if` sözdizimi

```shell
# One line
# Note: The 3rd statement may run when the 1st is true
[[ $var == hello ]] && echo hi || echo bye
[[ $var == hello ]] && { echo hi; echo there; } || echo bye

# Multi line (no else, single statement)
# Note: The exit status may not be the same as with an if statement
[[ $var == hello ]] &&
    echo hi

# Multi line (no else)
[[ $var == hello ]] && {
    echo hi
    # ...
}
```

## Değişkeni ayarlamak için basit `case` ifadesi

Yerleşik `:` tekrar tekrar `variable=` kullanmaktan kaçınmak için kullanılabilir. `$_` değişkeni çalıştırılan son komutun son argümanını tutar. `:` her zaman başarılıdır, dolayısıyla değişkeni kaydetmek için kullanılabilir.

```shell
# Modified snippet from Neofetch.
case "$OSTYPE" in
    "darwin"*)
        : "MacOS"
    ;;

    "linux"*)
        : "Linux"
    ;;

    *"bsd"* | "dragonfly" | "bitrig")
        : "BSD"
    ;;

    "cygwin" | "msys" | "win32")
        : "Windows"
    ;;

    *)
        printf '%s\n' "Unknown OS detected, aborting..." >&2
        exit 1
    ;;
esac

# Finally, set the variable.
os="$_"
```

<!-- CHAPTER END -->

<!-- CHAPTER START -->

# DİĞER

## `sleep` komutuna alternatif olarak `read` kullanma

Şaşırtıcı bir şekilde, `sleep` bir `bash` yerleşik komutu değildir, harici bir komuttur.

**CAVEAT:** `bash` 4+ gerektirir

**Örnek Fonksiyon:**

```sh
read_sleep() {
    # Usage: read_sleep 1
    #        read_sleep 0.2
    read -rt "$1" <> <(:) || :
}
```

**Örnek Kullanım:**

```shell
read_sleep 1
read_sleep 0.1
read_sleep 30
```

Aşırı sayıda dosya tanımlayıcısının açılması ve kapatılmasının ekonomik olmadığı performans açısından kritik olan durumlar için, bir dosya tanımlayıcısının tahsisi, tüm `read` çağrıları için yalnızca bir kez yapılabilir:

(https://blog.dhampir.no/content/sleeping-without-a-subprocess-in-bash-and-how-to-sleep-forever adresindeki orijinal uygulamaya bakın)

```shell
exec {sleep_fd}<> <(:)
while some_quick_test; do
    # equivalent of sleep 0.001
    read -t 0.001 -u $sleep_fd
done
```

## Bir programın kullanıcının PATH'sinde olup olmadığını kontrol etme

```shell
# There are 3 ways to do this and either one can be used.
type -p executable_name &>/dev/null
hash executable_name &>/dev/null
command -v executable_name &>/dev/null

# As a test.
if type -p executable_name &>/dev/null; then
    # Program is in PATH.
fi

# Inverse.
if ! type -p executable_name &>/dev/null; then
    # Program is not in PATH.
fi

# Example (Exit early if program is not installed).
if ! type -p convert &>/dev/null; then
    printf '%s\n' "error: convert is not installed, exiting..."
    exit 1
fi
```

## `strftime` kullanarak geçerli tarihi alma

Bash'in, `date` komutunun yerine kullanılabilecek tarihi almak için `printf` gibi yerleşik bir metoda sahiptir.

**CAVEAT:** `bash` 4+ gerektirir

**Örnek Fonksiyon:**

```sh
date() {
    # Usage: date "format"
    # See: 'man strftime' for format.
    printf "%($1)T\\n" "-1"
}
```

**Örnek Kullanım:**

```shell
# Using above function.
$ date "%a %d %b  - %l:%M %p"
Fri 15 Jun  - 10:00 AM

# Using printf directly.
$ printf '%(%a %d %b  - %l:%M %p)T\n' "-1"
Fri 15 Jun  - 10:00 AM

# Assigning a variable using printf.
$ printf -v date '%(%a %d %b  - %l:%M %p)T\n' '-1'
$ printf '%s\n' "$date"
Fri 15 Jun  - 10:00 AM
```

## Mevcut kullanıcının kullanıcı adını alma

**CAVEAT:** `bash` 4.4+ gerektirir

```shell
$ : \\u
# Expand the parameter as if it were a prompt string.
$ printf '%s\n' "${_@P}"
black
```

## Bir UUID V4 oluşturma

**UYARI** : Üretilen değer kriptografik olarak güvenli değildir.

**Örnek Fonksiyon:**

```sh
uuid() {
    # Usage: uuid
    C="89ab"

    for ((N=0;N<16;++N)); do
        B="$((RANDOM%256))"

        case "$N" in
            6)  printf '4%x' "$((B%16))" ;;
            8)  printf '%c%x' "${C:$RANDOM%${#C}:1}" "$((B%16))" ;;

            3|5|7|9)
                printf '%02x-' "$B"
            ;;

            *)
                printf '%02x' "$B"
            ;;
        esac
    done

    printf '\n'
}
```

**Örnek Kullanım:**

```shell
$ uuid
d5b6c731-1310-4c24-9fe3-55d556d44374
```

## İlerleme çubukları

Bu, fonksiyonun kendisinde for döngüsüne ihtiyaç duymadan ilerleme çubuklarını çizmenin basit bir yoludur.

**Örnek Fonksiyon:**

```sh
bar() {
    # Usage: bar 1 10
    #            ^----- Elapsed Percentage (0-100).
    #               ^-- Total length in chars.
    ((elapsed=$1*$2/100))

    # Create the bar with spaces.
    printf -v prog  "%${elapsed}s"
    printf -v total "%$(($2-elapsed))s"

    printf '%s\r' "[${prog// /-}${total}]"
}
```

**Örnek Kullanım:**

```shell
for ((i=0;i<=100;i++)); do
    # Pure bash micro sleeps (for the example).
    (:;:) && (:;:) && (:;:) && (:;:) && (:;:)

    # Print the bar.
    bar "$i" "10"
done

printf '\n'
```

## Bir komut dosyasındaki işlevlerin listesini alma

```sh
get_functions() {
    # Usage: get_functions
    IFS=$'\n' read -d "" -ra functions < <(declare -F)
    printf '%s\n' "${functions[@]//declare -f }"
}
```

## Kabuktaki takma isimleri atlama

```shell
# alias
ls

# command
# shellcheck disable=SC1001
\ls
```

## Kabuk fonksiyonları atlama

```shell
# function
ls

# command
command ls
```

## Arka planda bir komut çalıştırma

Bu, verilen komutu çalıştıracak ve terminal veya SSH bağlantısı sonlandırıldıktan sonra bile çalışmaya devam edecektir. Tüm çıktılar dikkate alınmaz.

```sh
bkr() {
    (nohup "$@" &>/dev/null &)
}

bkr ./some_script.sh # some_script.sh is now running in the background
```

<!-- CHAPTER END -->

# SONSÖZ

Okuduğunuz için teşekkürler! Bu incil size herhangi bir şekilde yardımcı olduysa ve karşılığını vermek istiyorsanız bağış yapmayı düşünebilirsiniz. Bağışlar, mümkün olan en iyi kaynağı harcayabilmem için bana zaman veriyor. Bağış yapamaz mısın? Sorun değil, depoya yıldız verin ve arkadaşlarınızla paylaşın!

<a href="https://www.patreon.com/dyla"><img src="https://img.shields.io/badge/donate-patreon-yellow.svg"></a>

Devam et. 🤘
