# Kırşehir Kitap & Kırtasiye Portalı

Kırşehir ilindeki yerel kitapçı ve kırtasiyelerin dükkanları adına üye olarak stok ve fiyat paylaştığı, okurların anlık arama ve fiyat karşılaştırması yapabildiği ve "Favori Kitaplarım" listesi oluşturabildiği tam kapsamlı web platformudur.

## Proje Bileşenleri
1. **`kirsehir-kitap.html`**: Doğrudan tarayıcıda çalışan, görsel olarak zengin, LocalStorage veritabanına ve tam arayüze sahip Canvas web uygulaması.
2. **`schema.sql`**: İlişkisel SQL veritabanı şeması (Kullanıcılar, Dükkanlar, Kitaplar, Stok Envanteri, Favoriler).
3. **`app/main.py` & `app/models.py`**: Python FastAPI tabanlı REST API servisi ve SQLAlchemy ORM modelleri.
4. **`requirements.txt`**: Gerekli Python kütüphaneleri.

## Başlatma Talimatı
- **Web App**: `kirsehir-kitap.html` dosyasını çift tıklayıp tarayıcınızda açın.
- **Backend API**:
  ```bash
  pip install -r requirements.txt
  uvicorn app.main:app --reload --port 8000
  ```
