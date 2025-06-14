# HMBOOK

Bu depo, UIKit kullanarak geliştirilmiş Firebase tabanlı bir kitap paylaşım ve mesajlaşma uygulamasını içerir. Kullanıcılar hesap oluşturabilir, kitaplarını fotoğraf ile birlikte paylaşabilir ve her kitap başlığı altında diğer kullanıcılarla mesajlaşabilir.

## Özellikler

- **Kayıt ve Giriş:** Firebase Authentication ile e‑posta ve parola kullanarak hesap açma ve oturum açma
- **Kitap Listesi:** Firestore'da tutulan kitapların tablo görünümünde listelenmesi
- **Kitap Ekleme:** Fotoğrafı Firebase Storage'a yükleyip Firestore'da kitap bilgisi oluşturma
- **Mesajlaşma:** Her kitap için Realtime Database üzerinden sohbet alanı
- **Çıkış Yapma:** Kullanıcı oturumunu sonlandırma

## Proje Yapısı

- `App/` – `AppDelegate` ve `SceneDelegate` dosyaları, Firebase kurulumunu yapar
- `Controller/` – Ekranların denetleyicileri: oturum açma, kayıt, kitap listesi, mesajlaşma ve yükleme işlemleri
- `View/` – Storyboard ve XIB dosyaları
- `Assets.xcassets/` – Uygulama ikonları ve görseller

## Kurulum

1. Depoyu klonlayın:
   ```bash
   git clone <repo-url>
   ```
2. Kendi `GoogleService-Info.plist` dosyanızı projeye ekleyin. Örnek dosya `App/GoogleService-Info.plist` konumunda yer alır.
3. Projeyi Xcode ile açın ve gerekli Firebase paketlerini (Authentication, Firestore, Storage, Realtime Database) ve `SDWebImage` kütüphanesini ekleyin (Swift Package Manager önerilir).
4. Uygulamayı gerçek cihazda veya simülatörde çalıştırın.

## Kullanım

- Uygulama açıldığında giriş ekranı gelir. Hesabınız yoksa *Kaydol* seçeneğiyle kayıt olabilirsiniz.
- Giriş yaptıktan sonra ana sayfada paylaşılan kitapları görürsünüz. Buradan yeni kitap ekleyebilir veya mevcut bir kitaba ait mesajları görüntüleyebilirsiniz.
- **Kitap Ekle** ekranında görsel seçip kitap adını girdikten sonra paylaşım yapılır.
- Bir kitap seçildiğinde mesajlaşma ekranı açılır ve diğer kullanıcılarla sohbet edebilirsiniz.

## Gereksinimler

- Xcode 14 veya üzeri
- iOS 13.0 ve sonrası sürümleri hedefler

## Lisans

Bu proje [MIT Lisansı](LICENSE) ile lisanslanmıştır.
