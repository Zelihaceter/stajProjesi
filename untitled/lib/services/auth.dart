import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //giris yap
  Future<User?> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  //çıkış yap fonksiyonu
  signOut() async {
    return await _auth.signOut();
  }

  //kayıt ol fonksiyonu
  Future<User?> createUser(String name, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore.collection("Users").doc(email).set({
      "email": email,
      "password": password,
    }).then((value) {
      _firestore
          .collection("Users")
          .doc(email)
          .collection("Users_Info")
          .doc(email)
          .set({
        "name": name,
        "Image": "url",
        "mail": email,
        "phone": "Tel_No",
      });

      _firestore
          .collection("Users")
          .doc(email)
          .collection("Education_info")
          .doc(email)
          .collection("Last_Lesson")
          .doc(email)
          .set({
        "son_ders": "Lesson_1",
      });
    });

    return user.user;
  }

  //veri okuma
  veriGetir(String lessonName) {
    var text, tit, url;
    CollectionReference lessonRef = _firestore.collection("Lessons");
    var textRef =
        lessonRef.doc(lessonName).collection(lessonName).doc(lessonName);
    var response = "sad";
  }

  Future<User?> createLesson(String name, String email, String password) async {
    await _firestore.collection("Lessons").doc("Lessons").set({}).then(
      (value) {
        _firestore
            .collection("Lessons")
            .doc("Lesson_1")
            .collection("Lesson_1")
            .doc("Lesson_1")
            .set(
          {
            "Title": "Eğitime Genel Bakış ve Öneriler" +
                " Ne Öğreneceğiz ? Bizleri Neler Bekliyor ?",
            "Text": " Java 101 patikasında öğrenecekleriniz :" +
                " Programlama Temelleri" +
                " Soyut Düşünme"
                    " Algoritmik Düşünce"
                    " Java Programlama Dili"
                    " Programlama Temelleri :"
                    " Java 101 patikası ile programlamanın temellerini öğreneceksiniz. Patikanın amacı programlama öğrenmek isteyen kişilere hiç bilgisi ve programlama temeli olmasa bile programlamayı en temelden sağlam adımlarla öğretmektir." +
                "Soyut Düşünme :"
                    "Programlama öğrenmek, kişilerin soyut düşünme yetisini de geliştirmektedir. Her ne kadar programlar bilgisayar ekranında somut olarak bir çıktı verseler de, programı tasarlamak soyut bir kavramdır. Bu bağlamda bir programcı her zaman soyut düşünmelidir. Java 101 patikası ile yaptığımız pratikler ve ödevler ile soyut düşünme yetimizi geliştireceğiz." +
                "Algoritmik Düşünce :" +
                "Programlama , “bilgisayara çeşitli görevleri yerine getirmesi için talimat vermenin” bir yoludur. Bu talimatlar, makinelerin nasıl çalışacağını veya çalıştıracağını söyleyebilir. Programlama bilgisayara ne yapması gerektiğini söyleyen, problemlere çözümler üreten ve bu çözümleri algoritmalar ile destekleyen bir öğretme işlemidir. Algoritma ise belli bir problemi çözmek ya da belirli bir amaca ulaşmak için tasarlanan yoldur. Java 101 patikası algoritmik düşünme yetimizi yaptığımız pratikler ve ödevler ile geliştirmemize yardımcı olacaktır." +
                "Java Programlama Dili :" +
                "Programlamaya ilk adımı günümüzün popüler dillerinden biri olan Java ile atacağız. Dizüstü bilgisayarlardan veri depolama merkezlerine, oyun konsollarından bilimsel süper bilgisayarlara, cep telefonlarından Internet'e kadar çoğu yerde Java dili kullanılmaktadır ve programlama temellerini atmak için ideal bir programlama dilidir." +
                "Öneriler" +
                " Eğitimi takip ederken verimli olabileceğini düşündüğümüz bir kaç önerimiz var." +
                "Eğitmen ile birlikte kod yazmaya çalışmayın. Bir kaç defa eğitimi izleyip sonrasında eğitim içeriğinde ki konuları kendiniz yapmaya çalışın." +
                "Anlamadığınız ve kafanıza oturmayan yerleri es geçmeyip başka kaynaklardan araştırmalar yapın. Yine sonuç bulamazsanız bilen birilerine sormayı deneyin." +
                "Bol bol pratik yapın. Programlama öğrenmenin en önemli noktaları “Sabır ve Pratiktir”. Çünkü bir işe en başından başlıyorsunuz. Bir işe sıfırdan başlarken sabırlı ve sürekli pratik yapmanız gerekmektedir. Sonuçta bir şeyi öğrenmenin en temel yollarından birisi bıkmadan usanmadan pratik yapmaktır." +
                "Hata yapmaktan korkmayın. Kod yazarken hata yapma olasılığı çok yüksektir. Her seviyede ki programcı elbet bir yerler de hata yapar. Sonuçta kesin kuralları olan bir dil üzerinden komutlar yazıyoruz. Önemli olan yazdığımız koddaki hataları bulup düzeltebilmektir." +
                "Tersine Mühendislik. Bir başkasının kodunu satır satır incelerseniz ve nasıl çalıştığını anlarsanız hem programlamaya bambaşka bir pencereden bakmış olursunuz hem de ufkunuzu genişletirsiniz.",
            "Video_Link": "https://www.youtube.com/watch?v=nyowsEg2Jj0",
          },
        );
        _firestore
            .collection("Lessons")
            .doc("Lesson_2")
            .collection("Lesson_2")
            .doc("Lesson_2")
            .set(
          {
            "Title": "Temel Kavramlar ",
            "Text": "Program Nedir ?\n" +
                " Sözlükte program kelimesi, belirli şartlara ve düzene göre yapılması öngörülen işlemlerin bütünü ve aynı zamanda izlence olarak tanımlanmıştır. Yazılımcılara göre Program, bilgisayara bir işlemi yaptırmak için yazılan komutlar dizisidir.\n" +
                " Programlama Nedir ?\n" +
                " Programlama, “bilgisayara çeşitli görevleri yerine getirmesi için talimat vermenin” bir yoludur. Bu talimatlar, makinelerin nasıl çalışacağını veya çalıştıracağını söyleyebilir. Programlama bilgisayar ne yapması gerektiğini söyleyen, problemlere çözümler üreten ve bu çözümleri algoritmalar ile destekleyen bir öğretme işlemidir.\n" +
                " Günümüzde bir çok özelliğe sahip, işlem güçleri yüksek bilgisayarlar veya donanımlar mevcut. Hatta süper bilgisayar olarak adlandırılan milyon dolarlar harcanan donanımlar bile kullanılıyor. Ama bu bilgisayarlara ne yapacağını söylemediğiniz sürece, dünyanın en vasıfsız cihazlarından bir farkları olmayacaktır. Bilgisayarları hayatımızda bu kadar önemli hale getirmek için programlama tanımı devreye girmektedir.\n" +
                " Algoritma Nedir ?\n" +
                " Algoritma belirli bir problemi çözmek veya belirli bir şartı sağlamak için tasarlanmış yoldur .Bilgisayar bilimlerinde ve Matematikte bir işi yapmak için oluşturulan, başlangıç ve bitiş noktası olan sonlu işlemler kümesidir. Bilgisayar bilimlerinin önemli bir parçası olup , programlamada kullanılır. Tüm programlama dillerinin temelleri algoritmaya dayanır.\n" +
                " Bir bilgisayarları harekete geçirmek için, bilgisayar programları yazmak gerekmektedir. Bir program yazmak için, bilgisayar adım adım, tam olarak ne yapmak istediğini söylemek gerekir. Bilgisayar daha sonra bu adımları izleyerek istediğimiz eylemi gerçekleştirir.\n" +
                " Bilgisayara ne yapacağınızı söylediğinizde, bunun nasıl yapılacağını da seçersiniz. İşte burada bilgisayar algoritmaları devreye giriyor. Algoritma işi yapmak için kullanılan temel tekniktir. Algoritma kavramını anlamanıza yardımcı olacak bir örnek izleyelim.\n" +
                " Başka şehirden bir arkadaşınız sizi ziyarete gelecektir. Arkadaşınızın havaalanından evinize gelmesi gerektiğini varsayalım. İşte arkadaşınıza evinize gelmesi için verebileceğiniz dört farklı algoritma :\n" +
                " Taksiye bin\n" +
                " Araç kirala\n" +
                " Otobüse bin\n" +
                " Ben seni alırım\n" +
                " Bu algoritmaların dördü de tamamen aynı hedefe ulaşır, ancak her algoritma bunu tamamen farklı bir şekilde yapar. Her algoritmanın farklı bir maliyeti ve farklı bir seyahat süresi vardır. Örneğin bir taksiye binmek muhtemelen en hızlı, ama aynı zamanda en pahalı olanıdır. Otobüse binmek kesinlikle daha ucuz, ama çok daha yavaş. Algoritmayı koşullara göre seçersiniz.\n" +
                " Bilgisayar programlamada, verilen herhangi bir görevi yerine getirmenin birçok farklı yolu vardır. Her algoritmanın farklı durumlarda avantajları ve dezavantajları vardır. Bizler en uygun algoritmaları seçmeye çalışırız.\n" +
                " Programlama Dili Nedir ?\n" +
                " Dil, binlerce yıldır insanlar için iletişim aracı olmuştur. Bir topluluk için, dil insanların iletişim kurması gereken kelimeleri içeriyordur. Bilgisayarlara baktığımızda da , bu durumun çok farklı olmadığını göreceksiniz. Birbirleriyle iletişim kurması gereken bir çok donanım ve yazılım bileşenleri vardır.\n" +
                " Eski bilgisayarlar aslında devre ve kabloların yerleriyle oynayarak bir ve sıfırların elle değiştirilmesiyle programlandı. Tabii ki, bu tür ilkel programlar için kullanılan yöntem zordu. Bu nedenle programlama dillerinin oluşturulması, bilgisayar bilimlerini başka bir seviyeye taşıyan devrim niteliğinde bir adımdı. Normal dillerden farklı olarak, programlama dillerindeki anahtar kelimeler sınırlıdır. Bu kelimeleri birleştirerek , programcılar farklı türlerde programlar oluşturabilirler. Yazılan kodları makinenin anladığı dile dönüştüren ara birimlerde mevcuttur.\n" +
                " \"Programlama Dili , insanların bilgisayarlarla etkileşime girdiği bir dizi talimattır.\"" +
                " Sözdizimi (Syntax) Nedir ?\n" +
                " Syntax (Sözdizimi ), yazılan herhangi bir sözün sırasıyla ilgilenen bilim dalıdır. Türkçede cümlelerin ögelerinin diziliminin bir sırası söz konusuysa diğer programlama dillerinde de aynı şey söz konusudur. Programlama dillerinde de tıpkı bizim günlük hayatta kullandığımız dilde olduğu gibi belli dizilim kuralları vardır. Bu dizilim kuralları sayesinde her şey makineler ve insanlar tarafından daha rahat anlaşılabilir ve yorumlanabilir bir hal almaktadır. Bunların dışına çıkıldığında veya bir eksiklik yapıldığında o kod satırı tam olarak yorumlanamaz ve hatayla karşılaşılır. Buna da Syntax Error adı verilmektedir.\n",
            "Video_Link": "https://www.youtube.com/watch?v=OShA3WNrdLg",
          },
        );
        _firestore
            .collection("Lessons")
            .doc("Lesson_3")
            .collection("Lesson_3")
            .doc("Lesson_3")
            .set(
          {
            "Title": "Java Nedir ? ",
            "Text": "Java Tarihçesi\n" +
                " 1991 yılında Sun Microsystems şirketi mühendislerinden James Gosling ve 12 arkadaşı Green Project(Yeşil Proje) isimli bir proje geliştirmeye başladılar. Gömülü Sistemler üzerine çalışan James Gosling ve ekibi başlangıçta C ve C++ dillerini kullansalar da bu dillerin geliştirdikleri projeye uygun bir dil olmadığını ve geliştirdikleri proje için yetersiz olduğunu görüp yeni bir arayış içine girdiler ve bu sırada “Oak” şimdiki adıyla Java dili doğmuş oldu.\n" +
                " Java, doğrudan C++ ile bağlantılıdır. C++ ise C’nin devamıdır. Java, karakteristik özelliklerinin birçoğunu bu iki dilden almıştır. C’nin sözdizimi (syntax), C++’ın ise nesne yönelimli programlama (object oriented programming- OOP) kavramları Java’ya miras kalmıştır. Bunun yanı sıra, Java, bu dillerdeki karmaşıklığı ortadan kaldırmış, eksik özelliklerini ise tamamlamıştır.\n" +
                " Java'nın Avantajları Nelerdir ?\n" +
                " Basit Olması\n" +
                " Java’nın yazımı kolaydır. daha okunaklı bir yapısı vardır ve dikkat çekicidir. Java geleceğe dönük olarak oluşturulacak yapılarla kullanımı kolaylaştırılır, sadeleştirilir ve öğrenmesi kolaydır.\n" +
                " Tarafsız Mimariye Sahip\n" +
                " Java özel makinelere ya da işletim sistemi mimarilerine bağlı değildir. Java donanımdan bağımsızdır. Java\'yı platform bağımsız kılan özelliği yazılan kaynak kodlar derlendikten sonra ara bir dil olan byte code\'a çevrilmesidir. Ara dile çevrilen bu kod parçaları Java Virtual Machine vasıtasıyla yorumlanır ve çalıştırılır. Buradaki tek sorun hız sorunudur. Çünkü işletim sistemiyle birlikte Virtual Machine’de bilgisayarın kaynaklarını kullandığı için daha yavaş çalışmaktadır.\n" +
                " Nesne Yönelimli Olması\n" +
                " Java da C++ gibi nesne yönelimlinin özelliklerinden faydalanır. Sınıflar oluşturularak daha az kod yazıp daha fazla iş yaparak kod tekrarı önlenmiş olur. Böylece geliştirme sürecinin verimliliği artar.\n" +
                " Zengin Kütüphane Desteği\n" +
                " Java çok zengin ve geniş bir kütüphaneye sahiptir ve ücretsiz olarak erişim sağlayıp temin edilebilir. Bu sayede bir çok platformda uygulama geliştirme imkanı sağlar.\n" +
                " Multi-Thread & Dinamik\n" +
                " \'Multi-Thread\' bir programda bir çok işlemin aynı zamanda gerçekleşmesi özelliğidir. Eş zamanlı işlemleri programlayabilmenize imkan tanır..Java bu tür program geliştirmeye destekler.\n" +
                " Neden Java Kullanmalıyız ?\n" +
                " Bilgisayarlarının %97'sinde Java Bulunuyor.\n" +
                " Dünya’da 9 Milyon Java Geliştiricisi Var\n" +
                " 3 Milyar Cep Telefonunda Java Bulunuyor\n" +
                " 125 milyon TV cihazı Java kullanıyor\n" +
                " Dizüstü bilgisayarlardan veri depolama merkezlerine, oyun konsollarından bilimsel süper bilgisayarlara, cep telefonlarından Internet'e kadar Java her yerde!\n" +
                " Java ile Uygulama Geliştirme Yapabileceğiniz Alanlar\n" +
                " Teknoloji ve onları geliştirmek için kullanılan diller sürekli bir evrim geçirmekte. Java dili, çok sayıda uygulamaya sahip popüler programlama dillerinden biridir. Java ile ne tür uygulanalar yapılabilir ?\n" +
                " Mobil Uygulamalar : Java, mobil uygulama geliştirme için çok kullanılan bir programlama dilidir. Android Studio ve Kotlin gibi yazılımlarla uyumludur. Çünkü Android İşletim Sistemi Java ile yazılmıştır. Android'in sınıf dosyalarını yürütmek için DVK (Dalvik Virtual Machine) kullanırken Java Virtual Machine (JVM) üzerinde çalışmaktadır. Java ve OOP ilkeleri ile Android ile daha iyi güvenlik ve basitlik sağlar.\n" +
                " Masaüstü Uygulamalar : Masaüstü uygulamaları Java ile kolaylıkla geliştirilebilir. Java ayrıca AWT, Swing ve JavaFX gibi eklentileri ile arayüz geliştirme desteği ve kolaylığı sağlar.\n" +
                " Web Tabanlı Uygulamalar : Java, web uygulamaları geliştirmek için de kullanılır. Servlets, Struts veya JSP eklentileri ile web uygulamaları için geniş destek sağlar. Bu teknolojiler sayesinde ihtiyacınız olan her türlü web uygulamasını geliştirebilirsiniz.\n" +
                " Kurumsal Uygulamalar : Java en çok talep gören programlama dillerden biridir. Büyük ve küçük işletmeler, bu dilde yazılmış uygulamalarla desteklenmektedir. Bu, yenilikçi bir ticari yazılım türü fikriniz varsa, Java muhtemelen sizin için en iyi dildir demektir. Havayollarının, devlet kurumlarının her gün kullandığı özel işletme yazılımlarının çoğu için de geçerlidir.\n" +
                " Bilimsel Uygulamalar : Bilimsel hesaplamalar ve matematiksel işlemler yaptırmak için Java çok kullanılan bir dildir. MATLAB gibi en popüler uygulamalardan bazıları, GUI (Arayüz) ve çekirdek yapılarında Java kullanır.\n" +
                " Oyun Programlama : Java, bağımsız oyun geliştirme şirketleri tarafından ve mobil oyunlar oluşturmak için yaygın olarak kullanılmaktadır. Java, 3 boyutlu oyunların tasarımı söz konusu olduğunda benzersiz bir yeteneğe sahip olan açık kaynaklı 3D Motor olan jMonkeyEngine'in desteğine sahiptir. Dünyanın en iyi mobil oyunlarının çoğu Java'da geliştirilmiştir. Minecraft, Mission Impossible III ve Asphalt 6 vb.\n" +
                " Gömülü sistem uygulamaları geliştirebilirsiniz. (Java2ME Embedded altyapısı ile) Java, gömülü sistem tasarımcıları için bir dizi avantaja sahiptir. Java, dil olarak, C ++ tehlikeleri olmadan nesne yönelimli programlamaya izin verir. Örneğin, Java sınıf kalıtımına izin verir, ancak birden çok ebeveynden gelmez, bu nedenle kafa karışıklığı fırsatı yoktur. Ayrıca Java, teknoloji geliştiricilerinin değişen pazar koşullarına hızla yanıt vermesini mümkün kılar. Uygun şekilde uygulanırsa, gömülü bir uygulamanın Java bölümleri uygulamanın geri kalanından izole edilebilir, böylece görev açısından kritik bölümleri Java bölümlerinin yol açtığı bozulmaya karşı korur.\n",
            "Video_Link": "https://www.youtube.com/watch?v=RNtrJxNDggk",
          },
        );
        _firestore
            .collection("Lessons")
            .doc("Lesson_4")
            .collection("Lesson_4")
            .doc("Lesson_4")
            .set(
          {
            "Title": "Java Geliştirme Araçlarının ve Ortamların Kurulumu ",
            "Text": "Java 101 patikasında kodlarımızı yazmak ve geliştirmek için IntelliJ IDEA geliştirme aracını kullanacağız." +
                " IntelliJ IDEA geliştirici üretkenliğini en üst düzeye çıkarmak için tasarlanmış kullanımı kolay bir araçtır.\n" +
                "Geliştirme Ortamı (JDK)\n" +
                "Java Geliştirme Kiti (JDK), JVM (Java Sanal Makinesi) ve JRE (Java Çalışma Zamanı Ortamı) ile birlikte Java programlamada kullanılan üç temel teknoloji paketinden biridir. JDK, geliştiricilerin JVM ve JRE tarafından çalıştırılabilen Java programları oluşturmalarına izin verir.\n" +
                "Kurulum\n" +
                "IntelliJ IDEA programı üzerinden direk kurulum sağlanabilir.\n",
            "Video_Link": "https://www.youtube.com/watch?v=m-DKUZS7zec",
          },
        );
        _firestore
            .collection("Lessons")
            .doc("Lesson_5")
            .collection("Lesson_5")
            .doc("Lesson_5")
            .set(
          {
            "Title": "Java'da Yazım ve İsimlendirme Kuralları ",
            "Text": "Yazım Kuralları\n" +
                " Türkçe Karakter Kullanımı : Java ve bir çok programlama dili Türkçe karakter desteklememektedir. Programda ki metin ifadeleri dışında Türkçe karakter kullanılmamalıdır. Türkçe Karakterler : ç, ı, ü, ğ, ö, ş, İ, Ğ, Ü, Ö, Ş, Ç\n" +
                " Harf Duyarlılığı : Java harfe duyarlı bir dildir. Kelimelerdeki küçük ve büyük harfler farklı olarak algılanır. Java’da Kodluyoruz ile kodluyoruz farklı anlama gelmektedir.\n" +
                " Sınıf Adları : Java’da sınıf adlarının ilk harfi büyük olmalıdır. Eğer 2 kelimeyi birleştirerek bir sınıf adı oluşturursak bu isimlerin baş harfleri büyük olmalıdır. Örnek: CamelCase\n" +
                " Metot Adları : Metot adları küçük harfle başlar. Metot adı verilirken iki kelime birleştirilecekse ismin başlangıç harfi küçük diğer birleştirilen kelimelerin başlangıç harfleri büyük yazılır. Örnek: camelCaseOrnek\n" +
                " İsimlendirme Kuralları\n\n" +
                " Camel Case Nedir ?\n" +
                " Camel Case, bir bileşik sözcük içindeki her kelimenin ilk sözcük dışında ki sözcüklerin ilk harfleri büyük harflerle yazıldığı bir adlandırma kuralıdır. Yazılım geliştiricileri genellikle kaynak kodu yazarken \"Camel Case\" kullanır. Camel Case kullanımı zorunlu bir kullanım olmasa da yazılım dilinin jargonudur ve genelde tüm yazılımcılar bu kurala uyar. Bu kural sayesinde değişken isimleri daha okunur olur.\n" +
                " Örnek : patikaDev, camelCaseKurali, javaPatikasiBasliyor\n" +
                " Upper Camel Case Nedir ?\n" +
                " Upper Camel Case isimlendirme kuralı ise, bileşik bir sözcükteki tüm sözcüklerin ilk harflerinin büyük olmasıdır.\n" +
                " Örnek : PatikaDev, UpperCamelCaseKurali, JavaPatikasiBasliyor\n" +
                " Snake Case\n" +
                " Kelimeler alt tire (_) ile birbirine bağlanır.\n" +
                " Upper snake case örnek: Hello_World\n" +
                " Lower snake case örnek: hello_world\n" +
                " Screaming Snake Case\n" +
                " Bütün harfleri büyük yazılır. Genellikle sabit isimlendirmede kullanılır.\n" +
                " Java'da İsimlendirme Kuralları\n\n" +
                " Java'da isimlendirilen tüm ögeler sadece A-Z veya a-z gibi harfler, \$ karakteri veya _ karakteri ile başlayabilirler.\n" +
                " Keyword’ler (Yasaklı Kelimeler) isimlendirmede kullanılamaz \n" +
                "Sınıflar için upper camel case kullanılır. HelloWorld \n" +
                "Metotlar için lower camel case kullanılır. helloWorld\n" +
                "Değişkenler için lower camel case kullanılır. helloWorld\n" +
                "Sabitler için screaming snake case kullanılır. HELLO_WORLD\n",
            "Video_Link": "https://www.youtube.com/watch?v=Y5wkz1hYp5w",
          },
        );
        _firestore
            .collection("Lessons")
            .doc("Lesson_6")
            .collection("Lesson_6")
            .doc("Lesson_6")
            .set(
          {
            "Title": "Main Metodu ve Kullanımı ",
            "Text": "Main Metodu ve Kullanımı\n" +
                " Java'da bir program çalışacağı zaman, kodlar ilk olarak main metodu içerisinden başlar. Main metodu sayesinde derleyiciye, programı buradan başlatılması konusunda referans oluşturulur.\n" +
                " Artık programı çalıştırdığımızda, derleyici ilk olarak main metodu okuyup sonrasında gerekli işlemleri yapacaktır.\n" +
                " Main metodu yazılırken, args yerine başka bir isimlendirme yapılabilir. Ancak genellikle args sözcüğü kullanılır ve bu sözcük arguments sözcüğünün kısaltmasıdır. Arguments ile ifade edilen kısım, sınıf çalıştırılırken JVM tarafından bu sınıfa verilen parametrelerdir.\n",
            "Video_Link": "https://www.youtube.com/watch?v=BXrDL-NeG_c",
          },
        );
        _firestore
            .collection("Lessons")
            .doc("Lesson_7")
            .collection("Lesson_7")
            .doc("Lesson_7")
            .set(
          {
            "Title": "Programlamaya Başlangıç",
            "Text": "İlk öğreneceğimiz kod parçacığı, Java'da Ekrana Veri Bastırma kodu olan System.out.println(\"Java101\"); komutunu öğreneceğiz. Ama ilk önce bilmemiz geren bir konu Java'da kodların nereye yazıldığı ve yazım kuralları ya da diğer adıyla söz dizimi (Syntax). Genellikle Syntax olarak ingilizce adıyla duyduğumuz bu terim herhangi bir programlama dilinin yazım kuralını belirler.\n" +
                "Genel Sözdizimi (Syntax)\n" +
                "    Java'da sınıflar içerisine kodlarımızı yazarız ve ilerleyen derslerde sınıflar konusuna derin bir giriş yapacağız. Daha sonra program çalıştığında çalışan bir metot olan \"Main Metodu\" sınıfımızın içerisine yazarız çünkü programı çalıştırmak için derleyici ilk olarak main metot içerisindeki komutları okuyacaktır.\n" +
                "    Main metot içerisine \"Gövde (body)\" adını veririz ve komutlarımızı ya da diğer adıyla ifadelerimizi gövde içerisine yazarız. Buraya yazdığımız kodlar derleyici tarafından yorumlanır ve çıktı olarak kullanıcıya verir. Genel olarak Java'nın Genel Sözdizim kuralları bu şekildedir.\n" +
                "Ekrana Veri Yazdırma\n\n" +
                "    Java'da ekrana veri yazdırmak için System.out.print(\"Hello World!\") kod parçacığı kullanılır. Bu komuta baktığımızda, iki parantez arasında, çift tırnaklar arasına ekrana yazdırmak istediğimiz sözcüğü yazmalıyız. Bu komutun iki farklı kullanım şekli mevcuttur, yazılan komuttan sonra yeni satıra inilmesi isteniyorsa System.out.println(); kullanılırken aynı satırda kalınması isteniyorsa System.out.print(); şeklinde kullanılır.\n" +
                "Escape Karakterler\n\n" +
                "    Java'da Escape (Kaçış) karakterleri ile bazı özel durumlar durumlar gerçekleştirilir. Kaçış karakterleri ( / ) ters eğik çizgi ile ifade edilip sonrasında yazılan karakter ile özel işleve sahip olurlar.\n",
            "Video_Link": "https://www.youtube.com/watch?v=Uac0IIMnI9A",
          },
        );
        _firestore
            .collection("Lessons")
            .doc("Lesson_8")
            .collection("Lesson_8")
            .doc("Lesson_8")
            .set(
          {
            "Title": "Yorum Satırları ",
            "Text": "Yorum satırları, kod içi belgeleme amacıyla kullanılan ve derleyiciler tarafından dikkate alınmayan kod parçalarıdır. Yorum satırları oluşturmamızın sebebi, Yazdığı kodun kritik kesimlerini açıklayarak, o koda daha sonra bakan kimselerin (büyük olasılıkla kendisinin) işini kolaylaştırmak amaçlanmaktadır. Java’da yorum satırları 3 farklı şekilde yazılır:\n" +
                "// ile yapılan yorumlar\n" +
                "    Tek satırlık bir açıklama yapılacaksa o satırın başına // işareti yazılır. ; // işaretinden sonra satır sonuna kadar her şey yorum olarak kabul edilir. Anlaşılacağı üzere bu işaretin satırın en başında olması zorunlu değildir. Ancak kodlama alışkanlığı bakımından satır başında kullanılması daha uygundur.\n" +
                "    // bu bir yorum satırıdır\n" +
                "    int number = 10; // number değişkenine 10 değeri atandı.\n" +
                "/* ... */ ile yapılan yorumlar\n" +
                "    Eğer birden fazla satırda yazılan bir açıklama varsa, her satırın başına // işareti koymak programcıya zor gelebilir. Bunun yerine, açıklama olarak değerlendirilmesi istenen satırlar /* ve */ işaretleri arasına alınır. Bu iki işaret arasında kalan kesimler derleyici tarafından yorum satırı olarak kabul edilir.\n" +
                "    /* Birden fazla satırdan oluşan bir yorum satırlarıdır. Ancak yorumların \n" +
                "    bu yolla ifade edilmesi için birden fazla satırdan oluşması zorunluluğu \n" +
                "    yoktur. */\n" +
                "    int number = 10; // number değişkenine 10 değeri atandı.\n" +
                "/** ... */ ile yapılan açıklamalar\n" +
                "    Bir uygulama geliştirilirken kod içi belgeleme yapmak güzel bir programlama alışkanlığıdır. Çünkü hem yapmakta olduğunuz işi en güzel o işi yaparken açıklayabilirsiniz, hem de açıklayabildiğiniz kodu anlamışsınız demektir ve o kodu açıklayarak yazdığınız için hata yapma olasılığınız düşer.\n" +
                "    Öte yandan, çoğu zaman uygulamaların raporlarının oluşturulması gerekir. Kod yazıldıktan sonra kodun içine yazılan açıklamalardan bir belge oluşturarak bu belgeyi raporun sonuna eklemek programcının yükünü hafifletecektir. İşte şimdi bahsedeceğimiz üçüncü yöntem bu amaçla kullanılır. /** ve */ işaretleri arasına yazılan açıklamalar bir takım özel etiketler içerebilir. Kod içi belgeleme, bu etiketleri tanıyan ve etiketlerden faydalanarak belge üreten bir aracın yardımı ile belgeye dönüştürülebilmektedir.\n" +
                "    Bu tarzda yazılan açıklama satırlarına Javadoc adı verilmektedir. Javadoc için kullanılabilecek bazı örnekler ve ne için kullanılabilecekleri aşağıda listelenmiştir:\n",
            "Video_Link": "https://www.youtube.com/watch?v=7nUBfgymS0M",
          },
        );
        _firestore
            .collection("Lessons")
            .doc("Lesson_9")
            .collection("Lesson_9")
            .doc("Lesson_9")
            .set(
          {
            "Title": "Değişkenler ve Veri Tipleri",
            "Text": "    Değişkenler programlamada geçici bilgileri sakladığımız ve programcı tarafından belirlenen yapılardır.\n" +
                "     Değişkenler programlamanın temel yapısını oluşturmaktadır ve tüm programlama dillerinde kullanılan bir yapıdır. Değişkenler sayesinde program içinde yaptığımız işlemleri hafıza da tutar ve gerektiği yerlerde kullanırız.\n" +
                "     Değişkenlerin 4 özelliği bulunur ; Veri Tipi, İsim, Değer ve Adres.\n" +
                "    Değişkenlerde Veri Tipi, adından da anlaşılacağı üzere verinin saklanacağı türünü belirtmektedir bunlar sayılar,sözcükler ve programatik alanlar olabilir. Her değişkenin program içinde kullanıldığı ve çağrıldığı benzersiz bir ismi vardır. Bu değişkenlere birde değer atarız , işletim sistemimizde bu değişkeni hafızada tutar ve bir adres belirler.\n" +
                "    Java'da değişkenlerin veri tipleri vardır. Bu tipler Java'da varsayılan olarak tanımlı gelen ilkel tipler (primitive) de olabilir yahut yazılımcıların kendi tanımladığı ilkel olmayan tipler (non-primitive) de olabilir. İlkel tipler her zaman bir değere sahiptir. İlkel olmayan tipler ise 'null' (boş) olabilir. İlkel olmayan türlerin tümü aynı boyuta sahipken ilkel veri tiplerin boyutu alacağı veri tipine bağlıdır.\n" +
                "Java Değişken Tanımlama\n" +
                "    <veri tipi> <değişken ismi> = veri (değer)\n" +
                "    İlk önce değişkenin veri tipini ve değişkenin ismini yazarız ve istenirse aynı matematikteki gibi \"=\" eşittir ile değerini atarız.\n" +
                "    int number;\n" +
                "    // number isminde, int veri tipinde bir değişken tanımlanmış\n" +
                "    Veri tipleri aynı olan değişkenleri aynı satırda tanımlayabiliriz\n" +
                "    int a, b, c;\n" +
                "    // int veri tipinde 3 tane değişken tanımlanmış\n" +
                "    Değişkeni tanımladıktan sonra, atama operatörü (=) kullanarak değişkene atayabiliriz.\n" +
                "    double pi; // ilk başta double türünde bir değişken tanımladık\n" +
                "    pi = 3.14; // Daha sonra bu değişkene bir değer atadık\n" +
                "    Eğer bir değişkene hemen değer atayacaksanız, bunu iki satırda yapmak yerine tek bir satırda halledebilirsiniz.\n" +
                "    double pi = 3.14;\n" +
                "    Aynı satırda aynı türden birden fazla değişken tanımlıyorsak :\n" +
                "    int a = 1 , b = 2;\n" +
                "    // Aynı satırda int türünde 2 farklı değişken tanımlanmış ve ikisine de değer verilmiş\n" +
                "    Değişkene verilen değer sonrasında değiştirilebilir, ama aynı isimde ikinci bir değişken oluşturulamaz ve hata alırız.\n" +
                "Hatalı Kullanım :\n" +
                "    int a = 5; // a isminde bir değişken tanımlanmış\n" +
                "    int a = 1 ; // Bu satır hataya neden olur, a değişkeni zaten var\n" +
                "Doğru Kullanım :\n" +
                "   boolean a = true; // a isminde bir değişken tanımlanmış ve varsayılan bir değer verilmiş\n" +
                "    a = false; // a değişkeninin değeri değiştirilmiş\n" +
                "Java'daki İlkel Veri Tipleri\n" +
                "  Tam Sayılar\n" +
                "    Byte\n" +
                "    Short\n" +
                "    Integer\n" +
                "    Long\n" +
                "    Ondalıklı Sayılar\n" +
                "    Float\n" +
                "    Double\n" +
                "  Karakterler\n" +
                "    Char\n" +
                "  Mantıksal Değerler\n" +
                "    Boolean ",
            "Video_Link": "https://www.youtube.com/watch?v=paWSWDKk9uc",
          },
        );
        _firestore
            .collection("Lessons")
            .doc("Lesson_10")
            .collection("Lesson_10")
            .doc("Lesson_10")
            .set(
          {
            "Title": "Byte, Short, Int ve Long Veri Tipleri",
            "Text": "Java'da tam sayıları belirten veri tipleri Byte, Short, Integer ve Long'tur.\n" +
                "Byte\n" +
                "    8 bit uzunluğundadır. Max 127 , Min -128 değerleri arasındadır.\n" +
                "    Anahtar sözcük : byte\n" +
                "Short\n" +
                "    16 bit uzunluğundadır. Max 32,767 , Min -32,768 değerleri arasındadır.\n" +
                "    Anahtar sözcük : short\n" +
                "Integer\n" +
                "    32 bit uzunluğundadır. Max 2,147,483,647 , Min -2,147,483,648 değerleri arasındadır.\n" +
                "    En çok tercih edilen veri tipidir , sebebi ise optimize uzunluktadır.\n" +
                "    Anahtar sözcük : int\n" +
                "Long\n" +
                "    64 bit uzunluğundadır. Max 9,223,372,036,854,775,807 , Min -9,223,372,036,854,775,808 değerleri arasındadır.\n" +
                "    Int’in yetersiz olduğu yerlerde kullanılır\n" +
                "   Anahtar sözcük : long\n" +
                "    public class JavaPatika {\n" +
                "      public static void main(String[] args) {\n" +
                "        byte a = 120;\n" +
                "        short b = 1000;\n" +
                "        int c = 100000;\n" +
                "        long d = 10000000;\n" +
                "      }\n" +
                "    }",
            "Video_Link": "https://www.youtube.com/watch?v=-w5hdo-AJVw",
          },
        );
        _firestore
            .collection("Lessons")
            .doc("Lesson_11")
            .collection("Lesson_11")
            .doc("Lesson_11")
            .set(
          {
            "Title": "Float ve Double Veri Tipleri ",
            "Text": "    Java'da ondalıklı yani küsüratlı sayıları belirten veri tipleri Float ve Double'dır.\n" +
                "Float\n" +
                "    32 Bit boyutundadır ve 1.4×10^-45 ile 3.4×10^38 aralığında bir değer tanımlanabilir.\n" +
                "    Float içerisine tam sayı yazdığımız zamanda bile o sayı 1.0 şeklinde ondalıklı olarak algılar.\n" +
                "    Float ile double ayırmak için , float tanımlamalardan sonra ‘f’ veya ‘F’ konulmalıdır.\n" +
                "    Anahtar Sözcük : float\n" +
                "Double\n" +
                "    64 Bit boyutundadır ve 4.9×10^-324 ile 1.8×10^308 aralığında bir değer tanımlanabilir.\n" +
                "    Üst düzey matematiksel işlemlerde kullanılır\n" +
                "    Anahtar Sözcük : double\n" +
                "    Ondalık Sayı Veri Tiplerinden Hangisi Tercih Edilmelidir ?\n" +
                "    Bu sorunun cevabı değişken olmakla beraber hangi durumlarda Double veya Float kullanımınız için dikkat etmeniz gereken hususlar\n" +
                "    Double tipi, yüksek duyarlıklı ve hassas matematiksel işlemlerde kullanılır.\n" +
                "    Float basittir : hız ve bellek.\n" +
                "    Double daha yavaş ve fazla yer kaplar.(Bu işlemler arasında milisaniye oynar)\n" +
                "    Java hassas matematiksel işlemler, örneğin sinüs kosinüs fonksiyonları, double tipi değer döndürür.\n" +
                "    public class JavaPatika {\n" +
                "      public static void main(String[] args) {\n" +
                "        float number1 = 3.14F;\n" +
                "        float number2 = 3.14f;\n" +
                "        double number3 = 3.14;\n" +
                "      }\n" +
                "    }",
            "Video_Link": "https://www.youtube.com/watch?v=wkuRysMokig",
          },
        );
        _firestore
            .collection("Lessons")
            .doc("Lesson_12")
            .collection("Lesson_12")
            .doc("Lesson_12")
            .set(
          {
            "Title": "Char ve Boolean Veri Tipleri ",
            "Text": "Char\n" +
                "    Java\'da karakter değişkenleri saklamak için Char kullanılır. Char veri tipleri birleşerek String Sınıfından bir yapıya dönüşür.\n" +
                "    Karakterler Char ile saklanır.\n" +
                "    Diğer dillere göre Char Java’da 16 bittir.\n" +
                "    Java Unicode karakter setini kullanır ve tüm dilleri içerir.\n" +
                "    Java evrensel bir dil olarak tasarlandığı için karakter seti de evrensel set olan Unicode ile tanımlanmıştır.\n" +
                "    Anahtar Sözcük : char\n" +
                "Boolean\n" +
                "    Java, mantıksal değerleri saklamak için boolean adında bir tipe sahiptir.\n" +
                "    Boolean sadece iki değer alabilir : True ve False\n" +
                "    Genellikle koşul ve döngü işlemlerinde, kontrol amaçlı olarak kullanılır.\n" +
                "    Anahtar Sözcük : boolean\n" +
                "    public class JavaPatika {\n" +
                "      public static void main(String[] args) {\n" +
                "        char letter = 'u';\n" +
                "        boolean logic1 = true;\n" +
                "        boolean logic2 = false;\n" +
                "      }\n" +
                "    }",
            "Video_Link": "https://www.youtube.com/watch?v=S9IjwPEIdI0",
          },
        );
        _firestore
            .collection("Lessons")
            .doc("Lesson_13")
            .collection("Lesson_13")
            .doc("Lesson_13")
            .set(
          {
            "Title": "String Veri Tipi ",
            "Text": "String Sınıfı\n" +
                "    String sınıfı java.lang kütüphanelerinde bulunan ve metinlerle ilgili her türlü işlemin yapıldığı sınıftır. Java'da genellikle kelime tutmak için char yerine String sınıfı kullanılır. Basitçe şöyle düşünebiliriz , Char veri tipi tek bir karakter tutabiliyorken, charların birleşmeisyle oluşan sözcükleri String Sınıfı tutmaktadır.\n" +
                "    public class JavaPatika {\n" +
                "      public static void main(String[] args) {\n" +
                "        String words = \"Hello World\";\n" +
                "      }\n" +
                "    }",
            "Video_Link": "https://www.youtube.com/watch?v=UEUkmuZb1WM",
          },
        );
        _firestore
            .collection("Lessons")
            .doc("Lesson_14")
            .collection("Lesson_14")
            .doc("Lesson_14")
            .set(
          {
            "Title": "Temel Operatörler ",
            "Text": "Temel Operatörler\n" +
                "    Java dilinde operatörler birçok işlemi yapabilmenize olanak tanır. Örneğin: matematiksel operatörlerle birlikte aritmetik işlemler yapabilmenizi, ilişkisel operatörlerle verileri kıyaslayabilmeyi, atama operatörleri ile değişkenlerin değerlerini değiştirmeye fırsat verir.\n" +
                "    Java'da operatörler aşağıdaki gibi listelenebilir:\n" +
                "    Atama Operatörleri\n" +
                "    Aritmetiksel Operatörler\n" +
                "    İlişkisel ve Eşitlik Operatörler\n" +
                "    Koşul Operatörler\n" +
                "    Mantıksal Operatörler\n" +
                "    Atama Operatörü\n" +
                "Aritmetik Operatörler\n" +
                "    Java\'da Aritmetik Operatörler adından da anlaşılacağı üzere matematiksel işlemleri programlama dilinde uygulamamızı sağlarlar.\n" +
                "    Toplama : a + b\n" +
                "    Çıkarma : a – b\n" +
                "    Çarpma : a * b\n" +
                "    Bölme : a / b\n" +
                "    Mod alma : a % b\n" +
                "    1 arttırma : a++\n" +
                "    1 eksiltme : b--\n" +
                "Karşılaştırma Operatörleri\n" +
                "    Java\'da Karşılaştırma Operatörleri iki nesnenin birbirleriyle olan durumlarını belirler.\n" +
                "    Eşitlik : a == b\n" +
                "    Eşit Değil : a != b\n" +
                "    Büyüktür : a > b\n" +
                "    Küçüktür : a < b\n" +
                "    Büyük Eşittir : a >= b\n" +
                "    Küçük Eşittir : a <= b\n" +
                "Mantıksal Operatörler\n" +
                "    Java\'da Mantıksal Operatörler , nesnelerin veya ifadelerin mantıksal değerlerini yansıtır.\n" +
                "    Ve : a && b\n" +
                "    Veya : a || b\n" +
                "   Değil : !(a&&b)\n" +
                "Koşul Operatörü\n" +
                "   Java\'da Koşul Operatörleri ifadelerin sonucunda oluşacak olayları belirler.\n" +
                "    a = 5 ;\n" +
                "    b = (a == 1) ? 1 : 0\n" +
                "    Çıktısı : 0",
            "Video_Link": "https://www.youtube.com/watch?v=bHhA8PgZNuo",
          },
        );
        _firestore
            .collection("Lessons")
            .doc("Lesson_15")
            .collection("Lesson_15")
            .doc("Lesson_15")
            .set(
          {
            "Title": "Kullanıcıdan Veri Alma ",
            "Text": "    Java’da kullanıcıdan veri almak için Scanner sınıfı kullanılır. Ama bu sınıfı kullanmadan önce kodumuza Scanner sınıfını dahil etmemiz gerekir. Bunun için import deyimi kullanılır ;\n" +
                "    import java.util.Scanner;\n" +
                "    İmport deyimi projenin en başına yazılır. Kullanıcıdan verileri almak için değişkenlere ihtiyacımız vardır. İlk önce \"a\" adında veri tipi integer olan bir değişken oluşturalım. \n" +
                "    Oluşturduğumuz \"a\" değişkenine veriyi kullanıcıdan almak için yapmamız gereken Scanner sınıfını kullanmak. Scanner sınıfından türeyen adı \"input\" olan bir nesne tanımlayalım. Sınıf ve Nesne kavramları ilerleyen derslerde detaylıca anlatılacaktır.\n" +
                "    Scanner sınıfından nesne ürettikten sonra değişkenimize veri almak için, değişkenimizin türüne göre bir kod yazmamız gerekecektir.\n" +
                "    Eğer değişkenimizin \"integer\" türünde ise \"input.nextInt()\" veya double türünde ise \"input.nextDouble()\" kod bloğu kullanılmalıdır.\n" +
                "    import java.util.Scanner;\n" +
                "    public class JavaPatika {\n" +
                "    public static void main(String[] args) {\n" +
                "    Scanner input = new Scanner(System.in);\n" +
                "    int a,b;\n" +
                "    System.out.println(\"A sayısını giriniz : \");\n" +
                "    a = input.nextInt();\n" +
                "    System.out.println(\"B sayısını giriniz : \");\n" +
                "    b = input.nextInt();\n" +
                "    System.out.println(\"A Sayısı : \" + a);\n" +
                "    System.out.println(\"B Sayısı : \" + b);\n" +
                "    }\n" +
                "    }\n" +
                "    import java.util.Scanner;\n" +
                "    public class JavaPatika {\n" +
                "    public static void main(String[] args) {\n" +
                "    Scanner inp = new Scanner(System.in);\n" +
                "    // String Örneği\n" +
                "    String adSoyad = inp.nextLine();\n" +
                "    // Sayı Örnekleri\n" +
                "    int yas = inp.nextInt();\n" +
                "    double maas = inp.nextDouble();\n" +
                "    // Çıktılar\n" +
                "    System.out.println(\"Ad Soyad: \" + adSoyad);\n" +
                "    System.out.println(\"Yaş : \" + yas);\n" +
                "    System.out.println(\"Maaş : \" + maas);\n" +
                "    }\n" +
                "    }",
            "Video_Link": "https://www.youtube.com/watch?v=WG6kZ2Wv45M",
          },
        );
        _firestore
            .collection("Lessons")
            .doc("Lesson_16")
            .collection("Lesson_16")
            .doc("Lesson_16")
            .set(
          {
            "Title": "Karşılaştırma Operatörleri ",
            "Text": "Java\'da Karşılaştırma Operatörleri (Java Comparison Operators) sayesinde, farklı iki değişkenin birbirleriyle olan durumları hakkında bir yorum yapabilirsiniz.\n" +
                "    Kısacası Java'da Karşılaştırma Operatörleri , bir değişkenin başka bir değişkenden büyük, küçük, eşit değil veya eşit olup olmadığını belirler. Bu operatörlerin çoğunu günlük hayatımızda ve matematikte kullanıyoruz. \n" +
                "    İki değişkenin eşit olup olmadığını test ederken \"=\" değil de \"==\" kullanmanız gerektiğini (yani çift eşittir) unutmayın.\n" +
                "    JAVA KARŞILAŞTIRMA OPERATÖRLERİ\n" +
                "    Örnek\n" +
                "    Operatörlerden bahsetmeden önce 4 adet değişken tanımlayıp,bunlara değer ataması yapalım ve ilişkisel ifadelerimizi bu değişkenler üzerinden karşılaştıralım.\n" +
                "    **Bu karşılaştırmaları yaparken matematiksel ifademizi cümle haline getirip bu cümlenin doğruluğunu ve yanlışlığını test edeceğiz.**\n" +
                "    int A = 10;\n" +
                "    int B = 20;\n" +
                "    int C = 10;\n" +
                "    int D = 40 ;\n" +
                "    Elimizde A,B,C ve D olmak üzere 4 adet değişkenimiz var. Şimdi değişkenlerin birbirleri ile olan ilişkilerini inceleyelim.\n" +
                "== (Eşitlik Operatörü)\n" +
                "    (A == B) ;//Matematiksel ifademizi cümle haline getirelim. (10 Eşittir 20) bu cümle yanlış bir cümledir.10 sayısı 20 sayısına eşit olamayacağından sonucumuz yanlış yani false'tur.\n" +
                "    Aynı cümleleri diğer matematiksel ifadelerimiz içinde yazalım.\n" +
                "    (A == C) ; // (10 Eşittir 10 ) evet bu cümle doğru sonucumuz true.\n" +
                "    (C == D) ; // (10 Eşittir 40 ) bu cümle yanlıştır ve cevabımız false.\n" +
                "!= (Eşit Değil Operatörü)\n" +
                "    (A != D) ; // (10 Eşit Değildir 40 ) Evet 10 sayısı 40'a eşit değildir ve sonucumuz true'dur.\n" +
                "    (A != C) ; // (10 Eşit Değildir 10 ) Bu cümle doğru değildir.Bu yüzden cevabımız false'tur.\n" +
                "    (C != B) ; // (10 Eşit Değildir 20 ) True.\n" +
                "> (Büyüktür Operatörü)\n" +
                "    (A > D) ; // (10 Büyüktür 40 ) 10 sayısı 40 sayısından büyük değildir cümle yanlış olduğundan cevabımız false olacaktır.\n" +
                "    (D > C) ; // (40 Büyüktür 10) 40 sayısı 20 sayısından büyüktür,ifade doğrudur sonucumuz true'dur.\n" +
                "    (C > B) ; // (10 Büyüktür 20) False\n" +
                ">= (Büyük Eşittir Operatörü)\n" +
                "    (A >= D) ; // (10 Büyük Eşittir 40 ) 10 sayısı 40 sayısından büyük veya eşit değildir cümle yanlış olduğundan cevabımız false olacaktır.\n" +
                "    (A >= C) ; // (10 Büyük Eşittir 10) Burada 10 sayısı 10 sayısından büyük değildir ancak ona eşit olduğundan sonucumuz true olacaktır.\n" +
                "    (C >= B) ; // (10 Büyük Eşittir 20) False\n" +
                "< (Küçüktür Operatörü)\n" +
                "   (A < D) ; // (10 Küçüktür 40) 10 sayısı 40 sayısından küçük ve cümle doğrudur.Sonucumuz true.\n" +
                "   (D < C) ; // (40 Küçüktür 10) Bu cümle yanlış olduğundan sonucumuz false olacaktır.\n" +
                "   (C < B) ; // (10 Küçüktür 20) True\n" +
                "<= (Küçük Eşittir Operatörü)\n" +
                "    (A <= D) ; // (10 Küçük eşittir 40) 10 sayısı 40 sayısından küçüktür ve cümle doğrudur.Sonucumuz true.\n" +
                "    (A <= C) ; // (10 Küçük eşittir 10) 10 sayısı 10 sayısından küçük değildir ancak eşit olduğundan sonucumuz true.\n" +
                "    (C <= B) ; // (10 Küçük eşittir 20) True\n" +
                "    // Aşağıdaki Kodları kendi IDE'nizde çalıştırarak,farklı değerlerle sonuçları test edebilirsiniz.\n" +
                "    int A = 10;\n" +
                "    int B = 20;\n" +
                "    int C = 10;\n" +
                "    int D = 40 ;\n" +
                "  // == Operatörü\n" +
                "    System.out.println(A == B);\n" +
                "    System.out.println(A == C);\n" +
                "    System.out.println(C == D);\n" +
                "  // !=  Eşit Değil Operatörü\n" +
                "    System.out.println(A != D);\n" +
                "    System.out.println(A != C);\n" +
                "    System.out.println(C != B);\n" +
                "  // > Büyüktür Operatörü\n" +
                "    System.out.println(A > D);\n" +
                "    System.out.println(D > C);\n" +
                "    System.out.println(C > B);\n" +
                "  // >= Büyük-Eşittir Operatörü\n" +
                "    System.out.println(A >= D);\n" +
                "    System.out.println(A >= C);\n" +
                "    System.out.println(C >= B);\n" +
                "  // <  Küçüktür Operatörü\n" +
                "    System.out.println(A < D);\n" +
                "    System.out.println(D < C);\n" +
                "    System.out.println(C < B);\n" +
                "  // <= Küçük-Eşittir Operatörü\n" +
                "    System.out.println(A <= D);\n" +
                "    System.out.println(A <= C);\n" +
                "    System.out.println(C <= B);",
            "Video_Link": "https://www.youtube.com/watch?v=PSPfo1IvDYo",
          },
        );
        _firestore
            .collection("Lessons")
            .doc("Lesson_17")
            .collection("Lesson_17")
            .doc("Lesson_17")
            .set(
          {
            "Title": "Koşullu İfadeler ve Kod Blokları Mantıksal Operatörler",
            "Text": "Mantıksal Operatörler\n" +
                "    Java\'da Mantıksal Operatörler, değişkenler veya değerler arasındaki mantığı belirlemek için kullanılır. Türkçe',de ki bağlaç ekleri gibi düşünebilirsiniz.\n" +
                "    Bir kontrol işlemi sonucunda geriye true yada false değeri döndüren operatörlerdir. True / False döndüren ifadeler veya boolean tipinde değerler tutan değişkenler üzerinde kullanılabilirler. Konuyu anlayabilmek için ilk önce mantıksal operatörlerin neler olduğu öğrenilmelidir.\n" +
                "    Java'da Mantıksal Operatörler\n" +
                "    ? işareti operatörü ile Java'da mantıksal kıyaslama yapılabilir. ? ifadesi Java'daki \"if-else\" yapısı yerine kullanılabilir. Tek satırda bunu yapabilmemizi sağlar. Kullanımı ise if'in içerisinde yer alacak ifadeyi soru işaretinden önce yazılır, ifadenin doğru olması durumunda yapılacak işlemler soru işareti ile iki nokta arasına yazılır. İfadenin yanlış olması durumunda yapılacaklar ise iki noktadan sonra yazılır.\n" +
                "  Kullanımı : \n" +
                "    ( kontrol edilecek ifade ) ? doğru olması durumunda yapılacaklar : yanlış olması durumunda yapılacaklar\n" +
                "  Örnek :\n" +
                "    public class Test {\n" +
                "      public static void main(String args[]) {\n" +
                "        int a, b;\n" +
                "        a = 10;\n" +
                "        b = (a == 1) ? 20: 30;\n" +
                "        System.out.println( \"Value of b is : \" +  b );\n" +
                "        b = (a == 10) ? 20: 30;\n" +
                "        System.out.println( \"Value of b is : \" + b );\n" +
                "      }\n" +
                "    }\n" +
                "    Sonuç :\n" +
                "    Value of b is : 30 \n" +
                "    Value of b is : 20 \n" +
                "  Açıklama :\n" +
                "    b = (a == 1) ? 20: 30; => ifadesini incelenirse, (a == 1) ? 20: 30 ifadesinden başlamak daha doğru olacaktır. a'nın 1 olması durumunda 20 değeri, a'nın 1'den farklı olması durumunda 30 değeri dönecektir. b'nin değeri buradan dönen değere göre belirlenecektir. Kodda a değeri 10 olarak verildiği için b'nin değeri 30 olarak atanmaktadır.\n" +
                "    b = (a == 10) ? 20: 30; => ifadesi incelenirse, yine yukarıdaki açıklamaya benzer olarak a değerinin 10 olması durumunda 20, a değeri 10'dan farklı olması durumunda ise 30 değeri geriye dönecektir. Bu durumda a değeri kodda 10 olduğu için b değeri de 20 olarak atanacaktır.",
            "Video_Link": "https://https://www.youtube.com/watch?v=pkll6aDjM6Y",
          },
        );
        _firestore
            .collection("Lessons")
            .doc("Lesson_18")
            .collection("Lesson_18")
            .doc("Lesson_18")
            .set(
          {
            "Title": "Kod Blokları (Scope)",
            "Text": "Kod Blokları (Scope)\n" +
                "    İki küme parantezi “{“ ve “}” arasında kalan kod kesimine blok (scope) denir. “{“ işareti bir kod bloğu başlatır ve “}” işareti başlatılan kod bloğunu bitirir. Bu işaretler kodun sınırlarını belirlemekte kullanılır. Herhangi bir değişken, tanımlandığı kod bloğu içinde fiziksel olarak vardır ve o kod bloğu içine yazılan kod kesimlerinden erişilebilirdir. Bir blok içinde aynı değişken adı birden fazla kez kullanılamaz.\n" +
                "    public class JavaPatika {\n" +
                "    // JavaPatika sınıfına ait alan\n" +
                "    public static void main(String[] args) {\n" +
                "    // Main metota ait alan\n" +
                "System.out.println(\"Burası main metota ait\");\n" +
                "    }\n" +
                "    }\n" +
                "    Yukarıda ki örnekte göreceğiniz üzere, kod blokları kodlar arasındaki hiyerarşik düzeni de belirtir.\n" +
                "    Bu durumda ;\n" +
                "    - System.out.println(\"Burası main metota ait\"); => main metoda ait\n" +
                "    - public static void main(String[] args) {...} => JavaPatika sınıfına ait\n" +
                "    İç içe bir kod yapısını ve ögelerin bir birilerine aitlik durumlarını kod blokları ile sağlarız. Ayrıca her kod bloğundan sonra bir tab boyutunda boşluk bırakılır. Bunun sebebi kodun okunabilirliğini arttırmaktır. Kodun okunabilirliği bir yazılımcı için çok önemli bir noktadır.\n" +
                "  Kötü Kod Örneği\n" +
                "    public class JavaPatika {\n" +
                "    // JavaPatika sınıfına ait alan\n" +
                "    public static void main(String[] args) {\n" +
                "    // Main metota ait alan\n" +
                "    int a=1,b=2,c=3;\n" +
                "    System.out.println(\"Burası main metota ait\");\n" +
                "    }\n" +
                "    }\n" +
                "  Temiz Kod Örneği\n" +
                "    public class JavaPatika {\n" +
                "    // JavaPatika sınıfına ait alan\n" +
                "    public static void main(String[] args) {\n" +
                "    // Main metota ait alan\n" +
                "    int a = 1, b = 2, c = 3;\n" +
                "    System.out.println(\"Burası main metota ait\");\n" +
                "    }\n" +
                "    }",
            "Video_Link": "https://www.youtube.com/watch?v=oS-iIdteO8Q",
          },
        );
        _firestore
            .collection("Lessons")
            .doc("Lesson_19")
            .collection("Lesson_19")
            .doc("Lesson_19")
            .set(
          {
            "Title": "If ve Else Blokları",
            "Text": " If ve Else Blokları\n" +
                "    Java\'da mantıksal ve koşullu ifadeler için if blokları kullanılır.\n" +
                "    Java 'da if blokları Türkçede \"eğer\" cümlesinin verdiği anlamla aynı şeyi ifade etmektedir. Programlamada koşul oluşturmak için if ve else bloklarını kullanırız. Else deyimi \"değil ise\" anlamı katmaktadır ve if deyiminden sonra kullanılır. Programlama da if ve else deyimleri çok önemlidir ve kodlamanın temel yapı taşlarını oluştururlar. If ve Else blokları ile programımız içerisinde ki algoritmalarımızı oluştururuz.\n" +
                "    Koşula göre program içinde farklı işlemleri yerine getirmek gerekebilir. İf-else muhtemelen yazılım programlarında en yaygın kullanılan karar mekanizmasıdır. Bu tarz durumları Java'da kodlayabilmek için if-else karar mekanizmasının yanında switch-case gibi yapılarda kullanılmaktadır. İf-else karar mekanizması istenilen koşul gerçekleştiği takdirde çalışır. Kısacası belirlenen koşul doğruysa yazılan kod çalışır.\n" +
                "  Java\'da Karar Mekanizmaları\n" +
                "    Java\'da koşullu ifade ve şart oluşturmak için If ve Else kullanılırız. Ayrıca else if, switch gibi koşullu ifadelere sahiptir.\n" +
                "    Programımızda belirtilen bir koşul doğruysa yürütülecek bir kod bloğu belirtmek için if kullanılır.\n" +
                "    Aynı koşul yanlışsa yürütülecek bir kod bloğu belirtmek için else deyimi kullanılır.\n" +
                "    İlk koşul yanlışsa, test edilecek yeni bir koşul belirtmek için eğer if else deyimi kullanılır.\n" +
                "    Yürütülecek birçok alternatif kod bloğu belirtmek için switch deyimi kullanılır.\n" +
                "    Örneğin: \"yaşı 50\'den küçük olanların personel kayıtlarını getir\" gibi bir ifadede yaşı 50'den küçük olanları tespit etmek için karar mekanizmaları kullanılır. Eğer koşul sağlanmıyorsa başka bir kod bloğu işletilir. İfadenin yazılımsal olarak Java'da karşılığı aşağıdaki gibidir.\n" +
                "    if(age < 50) {\n" +
                "    // personel kayıtlarını getir\n" +
                "    }\n" +
                "    Koşulun gerçekleşip gerçekleşmediği \"if\" cümlesi içindeki ifadeye bağlıdır. Eğer mantıksal ifade true ise \"if\" kod bloğu çalıştırılır. Tabi ifadenin false döndüğü durumda da programın bir şeyler yapmasını isteyebiliriz. Bu durumda ise \"else\"ifadesi kullanılır. Aşağıdaki gibi bir örnekle açıklayabiliriz.\n" +
                "    Eğer, faiz oranı %70\'den büyükse \"Kurumsal Müşteri\" tipinde kredi ver, değilse \"Standart Müşteri\" tipinde kredi ver şeklinde bir karar mekanizması aşağıdaki gibi tasarlanabilir.\n" +
                "    if(creditRatio > 0.7) {\n" +
                "    System.out.println(\"Kurumsal müşteri tipinde kredi\");\n" +
                "    }\n" +
                "    else {\n" +
                "    System.out.println(\"Standart müşteri tipinde kredi\");\n" +
                "    }\n" +
                "    Koşullar birden fazla olabilir ve hiçbir koşula uymuyorsa en sonunda varsayılan bir duruma girilir ve o kod bloğunu çalıştırmak gerekir. Bu tarz durumlarda ise \"if - else if - else\" gibi yapılar kullanılır. İf-else yapısına bir örnek daha aşağıdaki gibi olabilir.\n" +
                "    if(ortalama >= 50){\n" +
                "    System.out.println(\"Dersi Geçtiniz\");\n" +
                "    }else{\n" +
                "    System.out.println(\"Dersten Kaldınız\");\n" +
                "    }\n" +
                "    Bu kod bloğunda karar yapımda eğer ortalama 50 ve üstü ise Dersi Geçtiniz yazar, değilse Dersten Kaldınız yazar. if kısmı koşulun doğruluğunu kontrol ediyor, else kısmı ise koşul yanlış ise devamında yazan kodu çalıştırıyor. Yani eğer ilk kısımda TRUE dönerse Dersi Geçtiniz yazacak, FALSE dönerse else kısmındaki kod çalışacak.\n" +
                "    else if\n" +
                "    if- else- if : if-else-if kalıbında, bir if satırı, istediğiniz sayıda else-if satırı ve isteğe bağlı olarak tanımlanan bir else satırı bulunur. Yani, else satırının tanımlanması şart değildir. Program, en başta yer alan if satırı ile if-else-if kalıbını değerlendirmeye başlar. İlk doğru ifadenin bulunduğu if veya else-if satırı ile karşılaştığında ilgili işlem satırını çalıştırır. \n" +
                "    Kalıbın geri kalan tüm satırlarını değerlendirmeye almadan geçer. \n" +
                "    Eğer if ve else if satırlarında yer alan ifadelerden hiç biri doğru bir sonuç vermezse, else satırında yer alan işlem satırını çalıştırır. else satırı da mevcut değilse, program if-else-if kalıbının hiç bir satırını çalıştırmadan bir sonraki satırdan çalışmasına devam eder. if-else-if kalıbında sadece tek bir satır işlem görür.\n" +
                "    Konumuzu açıklamak amacıyla aşağıdaki kodu inceleyebiliriz.\n" +
                "    if(i==10){\n" +
                "    System.out.println(\"i nin degeri 10'dur.\");\n" +
                "    }\n" +
                "    else if(i<10){\n" +
                "    System.out.println(\"i nin degeri 10'dan kücüktür.\");\n" +
                "    }\n" +
                "    else{\n" +
                "    System.out.println(\"i nin degeri 10'dan farklıdır ve 10'dan kücük degildir.\");\n" +
                "    }\n" +
                "    Sizce yukarıda yazdığımız kodun Console çıktısı nedir ?\n" +
                "   i nin degeri 10\'dan farklıdır ve 10\'dan kücük degildir.\n" +
                "    Örneğin tuz oranı %80 ve üzerinde ise \"yüksek derecede tuzlu\", %80 ile %50 arasında ise \"orta derecede tuzlu\"\n" +
                "    bunların dışında bir durumda ise \"düşük derecede tuzlu\" şeklinde ekrana bilgiler yazan bir program yazmak istediğimizde if-else if-else yapısını kullanabiliriz.\n" +
                "    float saltRatio = 0.9f;\n" +
                "     if(saltRatio >= 0.8) {\n" +
                "    System.out.println(\"yüksek derecede tuzlu\");\n" +
                "    }\n" +
                "    else if(0.5 < saltRatio && saltRatio < 0.8 ) {\n" +
                "    System.out.println(\"orta derecede tuzlu\");\n" +
                "    }\n" +
                "    else {\n" +
                "    System.out.println(\"düşük derecede tuzlu\");\n" +
                "    }\n" +
                "    \"if-else\" yapılarını iç içe de kullanma şansına sahibiz.\n" +
                "    Örneğin: 18 yaşından küçük olanlar kan bağışı yapamazlar, fakat, 18 yaşına eşit ve büyük olan bir kişi eğer kilosu 48'den büyükse kan verebilir,\n" +
                "    kilosu 48\'den küçükse kan veremez gibi basit bir kuralı Java'da kodlayalım.\n" +
                "    int age=25;\n" +
                "    int weight=48;\n" +
                "    if(age>=18){\n" +
                "    if(weight>=48){\n" +
                "    System.out.println(\"Kan verebilirsiniz\");\n" +
                "    }\n" +
                "    else{\n" +
                "    System.out.println(\"Kan veremezsiniz\");\n" +
                "   }\n" +
                "    }\n" +
                "    else{\n" +
                "    System.out.println(\"Kan verebilmek için yaşınız 18\'den büyük olmalıdır.\");\n" +
                "    }\n" +
                "    Sizce yukarıda yazdığımız kodun Console çıktısı nedir ?\n" +
                "    Kan verebilirsiniz.",
            "Video_Link": "https://www.youtube.com/watch?v=egbZAhoaLJI",
          },
        );
        _firestore
            .collection("Lessons")
            .doc("Lesson_20")
            .collection("Lesson_20")
            .doc("Lesson_20")
            .set(
          {
            "Title": "Switch-Case Yapısı",
            "Text": "Switch-Case Yapısı\n" +
                "    Java\'da birden çok kod bloğunu koşullara bağlamak için \"switch\" deyimi kullanılır. Switch Case; tanımlanmış olan yalnızca bir değişkenin, alacağı değerlere bağlı olarak, farklı sonuçlar döndürmesini sağlayan bir yapıdır. Switch kısmında kullanılacak olan değişkenler byte, short, int, char veya String veri tipine sahip olmalıdır.\n" +
                "  Sözdizimi (Syntax)\n" +
                "    switch(değer) {\n" +
                "      case x:\n" +
                "        // değer x'e eşitse bu kod bloğu çalışacak\n" +
                "      break;\n" +
                "      case y:\n" +
                "        // değer y'ye eşitse bu kod bloğu çalışacak\n" +
                "      break;\n" +
                "      default:\n" +
                "        // değer hiç bir şeye eşit değilse bu kod bloğu çalışacak\n" +
                "    }\n" +
                "    Burada dikkat edilmesi gereken durum switch içine yazdığımız değerleri case deyimi ile kontrol ediyoruz. Switch içinde ki herhangi bir değer caselerden biri ile uyuşuyorsa o case içindeki kod bloğu çalışır.\n" +
                "    import java.util.Scanner;\n" +
                "    public class SwitchCase {\n" +
                "      public static void main(String[] args) {\n" +
                "        Scanner input = new Scanner(System.in);\n" +
                "        int value = input.nextInt();\n" +
                "        switch (value) {\n" +
                "          case 1:\n" +
                "            // Value 1\n" +
                "          break;\n" +
                "          case 2:\n" +
                "            // Value 1\n" +
                "          break;\n" +
                "          case 3:\n" +
                "            // Value 1\n" +
                "          break;\n" +
                "          default:\n" +
                "            // Value is invalid\n" +
                "          break;\n" +
                "        }\n" +
                "      }\n" +
                "    }\n" +
                "    Yukarıdaki switch-case yapısında hangi kod bloğunun çalıştırılacağını value değişkeni belirler. Value değeri 1 ise case 1, 2 ise case 2, 3 ise case 3 kod bloğu çalıştırılır. Eğer value değişkeninin değeri hiçbir case değeriyle eşleşmiyorsa default alanı çalıştırılır. Her bir case durumunda, switch yapısından çıkmak ve switch'i izleyen bir sonraki ifadeye geçmek için 'break' komutu kullanılır. Break komutunun kullanılmadığı case'lerde ise ilgili case bloğu işletildikten sonra break komutunun bulunduğu satıra kadar olan tüm kod satırları çalıştırılır. Switch-case yapısının çalışma mantığı genel olarak bu şekildedir.\n" +
                "    Switch Case ifadeleri, çalışma mantığı açısından baktığımızda If - Else-if ifadeleri ile benzerlik göstermektedir. Ancak çok fazla koşul gerektiren durumlarda If - Else-if ifadelerinin yerine Switch ifadelerini tercih edebiliriz. Bu sayede uzun kod satırlarının aksine daha sade ve düzenli bir görünüm elde edebilir ve kodumuzun okunabilirliğini artırmış oluruz.\n" +
                "    Not: \"switch-case\" yapısında eğer her case\'in sonuna \"break\" ifadesi koymazsak aramış olduğu koşulu bulana kadar tüm case'lere girip o kod bloklarını çalıştıracaktır.\n" +
                "  Örnek\n" +
                "    public class SwitchCase {\n" +
                "      public static void main(String[] args) {\n" +
                "        int gun = 2;\n" +
                "        switch (gun) {\n" +
                "          case 6:\n" +
                "            System.out.println(\"Bugün cumartesi\");\n" +
                "          break;\n" +
                "          case 7:\n" +
                "            System.out.println(\"Bugün pazar\");\n" +
                "          break;\n" +
                "          default:\n" +
                "            System.out.println(\"Bugün hafta içi\");\n" +
                "        }\n" +
                "        // Çıktısı \"Bugün hafta içi\"\n" +
                "      }\n" +
                "    }",
            "Video_Link": "https://www.youtube.com/watch?v=yU2s_Pt9vuI",
          },
        );
      },
    );
  }
}
