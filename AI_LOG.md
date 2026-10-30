YAPAY ZEKAYA SORDUĞUM:
bir web sitesi yapıcam . siteye üye olmak için 2 seçenek var: kullanıcı ve dükkan sahibi. dükkan sahibi olarak kayıt yapılırsa dükkandaki kitapları,stokları ve fiyatları siteye yükleyenebilecek.eğer kullanıcı olarak kayıt yapılırsa dükkanların paylaştığı bilgileri görebilecek.yani sitemiz kitap ararken dükkan dükkan gezmek yerine siteden bakıp hangi dükkanda hangi kitap var öğrenmemize yarayacak.bunun için html,style ve script içeren kodları yaz.geri kalan detayları da nasıl olması gerekiyorsa hallet.sadece kodları ver ben direkt kopyala yapıştır yapıcam.

VERDİĞİ CEVAP:
Aşağıdaki kodu tek bir .html dosyasına (örneğin index.html) yapıştırıp tarayıcıda doğrudan çalıştırabilirsin:

HTML
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KitapBul | Yerel Kitabevi Rehberi</title>
    <style>
        :root {
            --primary: #2563eb;
            --primary-hover: #1d4ed8;
            --secondary: #f59e0b;
            --bg: #f8fafc;
            --card-bg: #ffffff;
            --text-main: #0f172a;
            --text-muted: #64748b;
            --border: #e2e8f0;
            --success: #10b981;
            --danger: #ef4444;
            --radius: 12px;
            --shadow: 0 4px 20px -2px rgba(15, 23, 42, 0.08);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }

        body {
            background-color: var(--bg);
            color: var(--text-main);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Üst Menü (Navbar) */
        header {
            background: var(--card-bg);
            border-bottom: 1px solid var(--border);
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 1px 3px rgba(0,0,0,0.03);
        }

        .logo {
            font-size: 1.4rem;
            font-weight: 800;
            color: var(--primary);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .logo span {
            color: var(--secondary);
        }

        .user-bar {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .role-badge {
            font-size: 0.8rem;
            font-weight: 600;
            padding: 0.3rem 0.75rem;
            border-radius: 999px;
            background: #eff6ff;
            color: var(--primary);
        }

        .role-badge.owner {
            background: #fef3c7;
            color: #b45309;
        }

        /* Ana Kapsayıcı */
        main {
            flex: 1;
            max-width: 1200px;
            width: 100%;
            margin: 0 auto;
            padding: 2rem 1.25rem;
        }

        .hidden {
            display: none !important;
        }

        /* Giriş / Kayıt Kartı */
        .auth-wrapper {
            max-width: 460px;
            margin: 2rem auto;
            background: var(--card-bg);
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            border: 1px solid var(--border);
            overflow: hidden;
        }

        .auth-tabs {
            display: flex;
            border-bottom: 1px solid var(--border);
            background: #f1f5f9;
        }

        .auth-tab {
            flex: 1;
            padding: 1rem;
            text-align: center;
            font-weight: 600;
            cursor: pointer;
            color: var(--text-muted);
            border: none;
            background: transparent;
            transition: all 0.2s;
        }

        .auth-tab.active {
            background: var(--card-bg);
            color: var(--primary);
            border-bottom: 2px solid var(--primary);
        }

        .auth-body {
            padding: 1.75rem;
        }

        .form-group {
            margin-bottom: 1.15rem;
        }

        .form-group label {
            display: block;
            font-size: 0.875rem;
            font-weight: 600;
            margin-bottom: 0.4rem;
            color: var(--text-main);
        }

        .form-control {
            width: 100%;
            padding: 0.7rem 0.9rem;
            border: 1px solid var(--border);
            border-radius: 8px;
            font-size: 0.95rem;
            transition: border-color 0.2s;
            outline: none;
        }

        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.12);
        }

        .role-selector {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0.75rem;
            margin-bottom: 1.15rem;
        }

        .role-option {
            border: 2px solid var(--border);
            border-radius: 10px;
            padding: 0.85rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.2s;
            user-select: none;
        }

        .role-option input {
            display: none;
        }

        .role-option.selected {
            border-color: var(--primary);
            background: #eff6ff;
            color: var(--primary);
        }

        .role-option strong {
            display: block;
            font-size: 0.95rem;
            margin-bottom: 0.2rem;
        }

        .role-option small {
            font-size: 0.75rem;
            color: var(--text-muted);
        }

        /* Butonlar */
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.4rem;
            padding: 0.75rem 1.25rem;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.95rem;
            cursor: pointer;
            border: none;
            transition: all 0.2s;
        }

        .btn-primary {
            background: var(--primary);
            color: white;
            width: 100%;
        }

        .btn-primary:hover {
            background: var(--primary-hover);
        }

        .btn-outline {
            background: transparent;
            border: 1px solid var(--border);
            color: var(--text-main);
            padding: 0.5rem 0.9rem;
            font-size: 0.85rem;
        }

        .btn-outline:hover {
            background: #f1f5f9;
        }

        .btn-danger {
            background: #fee2e2;
            color: var(--danger);
            padding: 0.4rem 0.75rem;
            font-size: 0.8rem;
        }

        .btn-danger:hover {
            background: var(--danger);
            color: white;
        }

        .demo-box {
            margin-top: 1.25rem;
            padding-top: 1.1rem;
            border-top: 1px dashed var(--border);
            text-align: center;
        }

        .demo-box p {
            font-size: 0.8rem;
            color: var(--text-muted);
            margin-bottom: 0.6rem;
        }

        .demo-buttons {
            display: flex;
            gap: 0.5rem;
        }

        .demo-buttons button {
            flex: 1;
        }

        /* İstatistik ve Özet Kartları */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 1.25rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: var(--card-bg);
            padding: 1.25rem 1.5rem;
            border-radius: var(--radius);
            border: 1px solid var(--border);
            box-shadow: var(--shadow);
        }

        .stat-card span {
            font-size: 0.85rem;
            color: var(--text-muted);
            font-weight: 500;
        }

        .stat-card h3 {
            font-size: 1.75rem;
            margin-top: 0.35rem;
            color: var(--text-main);
        }

        /* Dükkan Sahibi Düzeni */
        .owner-layout {
            display: grid;
            grid-template-columns: 350px 1fr;
            gap: 1.75rem;
            align-items: start;
        }

        @media (max-width: 900px) {
            .owner-layout {
                grid-template-columns: 1fr;
            }
        }

        .panel-card {
            background: var(--card-bg);
            border-radius: var(--radius);
            border: 1px solid var(--border);
            box-shadow: var(--shadow);
            padding: 1.5rem;
        }

        .panel-card h2 {
            font-size: 1.15rem;
            margin-bottom: 1.25rem;
            padding-bottom: 0.75rem;
            border-bottom: 1px solid var(--border);
        }

        /* Tablo Tasarımı */
        .table-responsive {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        th, td {
            padding: 0.9rem 0.75rem;
            border-bottom: 1px solid var(--border);
            font-size: 0.92rem;
        }

        th {
            color: var(--text-muted);
            font-weight: 600;
            background: #f8fafc;
        }

        .stock-control {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: #f1f5f9;
            padding: 0.2rem 0.4rem;
            border-radius: 6px;
        }

        .stock-btn {
            border: none;
            background: white;
            width: 24px;
            height: 24px;
            border-radius: 4px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 1px 2px rgba(0,0,0,0.06);
        }

        .stock-btn:hover {
            background: var(--primary);
            color: white;
        }

        /* Kullanıcı Arama ve Filtre Çubuğu */
        .search-bar {
            background: var(--card-bg);
            padding: 1.25rem;
            border-radius: var(--radius);
            border: 1px solid var(--border);
            box-shadow: var(--shadow);
            display: grid;
            grid-template-columns: 1fr 200px 200px auto;
            gap: 1rem;
            align-items: center;
            margin-bottom: 1.75rem;
        }

        @media (max-width: 850px) {
            .search-bar {
                grid-template-columns: 1fr;
            }
        }

        /* Kitap Kartları Grid */
        .books-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(290px, 1fr));
            gap: 1.25rem;
        }

        .book-card {
            background: var(--card-bg);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            padding: 1.35rem;
            box-shadow: var(--shadow);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: transform 0.15s ease;
        }

        .book-card:hover {
            transform: translateY(-3px);
        }

        .book-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 0.5rem;
            margin-bottom: 0.5rem;
        }

        .category-tag {
            font-size: 0.72rem;
            font-weight: 700;
            text-transform: uppercase;
            padding: 0.25rem 0.6rem;
            border-radius: 6px;
            background: #f1f5f9;
            color: var(--text-muted);
        }

        .stock-badge {
            font-size: 0.78rem;
            font-weight: 600;
            padding: 0.25rem 0.65rem;
            border-radius: 999px;
        }

        .stock-in {
            background: #d1fae5;
            color: #065f46;
        }

        .stock-out {
            background: #fee2e2;
            color: #991b1b;
        }

        .book-title {
            font-size: 1.15rem;
            font-weight: 700;
            color: var(--text-main);
            margin-bottom: 0.25rem;
        }

        .book-author {
            font-size: 0.9rem;
            color: var(--text-muted);
            margin-bottom: 1rem;
        }

        .shop-info {
            background: #f8fafc;
            border: 1px solid var(--border);
            border-radius: 8px;
            padding: 0.85rem;
            margin-bottom: 1rem;
            font-size: 0.85rem;
        }

        .shop-info strong {
            display: block;
            color: var(--text-main);
            font-size: 0.92rem;
            margin-bottom: 0.25rem;
        }

        .shop-info p {
            color: var(--text-muted);
            margin-bottom: 0.15rem;
        }

        .book-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 0.75rem;
            border-top: 1px solid var(--border);
        }

        .price-tag {
            font-size: 1.35rem;
            font-weight: 800;
            color: var(--primary);
        }

        .empty-state {
            grid-column: 1 / -1;
            text-align: center;
            padding: 3rem;
            background: var(--card-bg);
            border-radius: var(--radius);
            border: 1px dashed var(--border);
            color: var(--text-muted);
        }

        .alert {
            padding: 0.75rem 1rem;
            border-radius: 8px;
            font-size: 0.88rem;
            margin-bottom: 1rem;
            font-weight: 500;
        }

        .alert-error {
            background: #fee2e2;
            color: #991b1b;
        }

        .alert-success {
            background: #d1fae5;
            color: #065f46;
        }
    </style>
</head>
<body>

    <!-- Üst Bar -->
    <header>
        <div class="logo">
            📚 Kitap<span>Bul</span>
        </div>
        <div id="userBar" class="user-bar hidden">
            <span id="welcomeText" style="font-weight: 600; font-size: 0.92rem;"></span>
            <span id="roleBadge" class="role-badge"></span>
            <button id="toggleViewBtn" class="btn btn-outline hidden" onclick="toggleOwnerSearchView()">🔍 Tüm Dükkanlarda Ara</button>
            <button class="btn btn-outline" onclick="logout()">Çıkış Yap</button>
        </div>
    </header>

    <main>
        <!-- 1. GİRİŞ VE KAYIT EKRANI -->
        <section id="authSection" class="auth-wrapper">
            <div class="auth-tabs">
                <button id="tabLogin" class="auth-tab active" onclick="switchAuthTab('login')">Giriş Yap</button>
                <button id="tabRegister" class="auth-tab" onclick="switchAuthTab('register')">Üye Ol</button>
            </div>

            <div class="auth-body">
                <div id="authAlert" class="alert hidden"></div>

                <!-- GİRİŞ FORMU -->
                <form id="loginForm" onsubmit="handleLogin(event)">
                    <div class="form-group">
                        <label>E-posta Adresi</label>
                        <input type="email" id="loginEmail" class="form-control" placeholder="ornek@mail.com" required>
                    </div>
                    <div class="form-group">
                        <label>Şifre</label>
                        <input type="password" id="loginPassword" class="form-control" placeholder="••••••" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Giriş Yap</button>

                    <div class="demo-box">
                        <p>Hızlı Test İçin Tek Tıkla Demo Girişi:</p>
                        <div class="demo-buttons">
                            <button type="button" class="btn btn-outline" onclick="quickLogin('user')">👤 Kullanıcı Girişi</button>
                            <button type="button" class="btn btn-outline" onclick="quickLogin('owner')">🏪 Dükkan Girişi</button>
                        </div>
                    </div>
                </form>

                <!-- KAYIT FORMU -->
                <form id="registerForm" class="hidden" onsubmit="handleRegister(event)">
                    <label style="display:block; font-size:0.875rem; font-weight:600; margin-bottom:0.5rem;">Hesap Türü Seçin</label>
                    <div class="role-selector">
                        <label id="roleUserLabel" class="role-option selected" onclick="selectRole('user')">
                            <input type="radio" name="role" value="user" checked>
                            <strong>👤 Kullanıcı</strong>
                            <small>Kitap ve stok arar</small>
                        </label>
                        <label id="roleOwnerLabel" class="role-option" onclick="selectRole('owner')">
                            <input type="radio" name="role" value="owner">
                            <strong>🏪 Dükkan Sahibi</strong>
                            <small>Kitap ve fiyat yükler</small>
                        </label>
                    </div>

                    <div class="form-group">
                        <label>Ad Soyad</label>
                        <input type="text" id="regName" class="form-control" placeholder="Adınız Soyadınız" required>
                    </div>

                    <div class="form-group">
                        <label>E-posta Adresi</label>
                        <input type="email" id="regEmail" class="form-control" placeholder="ornek@mail.com" required>
                    </div>

                    <div class="form-group">
                        <label>Şifre</label>
                        <input type="password" id="regPassword" class="form-control" placeholder="En az 4 karakter" required minlength="4">
                    </div>

                    <!-- Dükkan Sahibi Ek Alanları -->
                    <div id="shopExtraFields" class="hidden">
                        <div class="form-group">
                            <label>Dükkan / Kitabevi Adı</label>
                            <input type="text" id="regShopName" class="form-control" placeholder="Örn: Çınar Kitabevi">
                        </div>
                        <div class="form-group">
                            <label>Dükkan Adresi ve İletişim</label>
                            <input type="text" id="regShopAddress" class="form-control" placeholder="Örn: Atatürk Cad. No:12 Merkez (0386 212 ..)">
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">Kaydı Tamamla</button>
                </form>
            </div>
        </section>

        <!-- 2. DÜKKAN SAHİBİ PANELİ -->
        <section id="ownerSection" class="hidden">
            <div class="stats-grid">
                <div class="stat-card">
                    <span>Dükkan Adı</span>
                    <h3 id="statShopName">-</h3>
                </div>
                <div class="stat-card">
                    <span>Kayıtlı Kitap Çeşidi</span>
                    <h3 id="statBookTypes">0</h3>
                </div>
                <div class="stat-card">
                    <span>Toplam Stok Adedi</span>
                    <h3 id="statTotalStock">0</h3>
                </div>
            </div>

            <div class="owner-layout">
                <!-- Sol: Yeni Kitap Ekleme Formu -->
                <div class="panel-card">
                    <h2>➕ Yeni Kitap / Stok Ekle</h2>
                    <div id="ownerAlert" class="alert hidden"></div>
                    <form id="addBookForm" onsubmit="handleAddBook(event)">
                        <div class="form-group">
                            <label>Kitap Adı</label>
                            <input type="text" id="bookTitle" class="form-control" placeholder="Örn: Olasılıksız" required>
                        </div>
                        <div class="form-group">
                            <label>Yazar</label>
                            <input type="text" id="bookAuthor" class="form-control" placeholder="Örn: Adam Fawer" required>
                        </div>
                        <div class="form-group">
                            <label>Kategori</label>
                            <select id="bookCategory" class="form-control">
                                <option value="Roman">Roman</option>
                                <option value="Bilim Kurgu">Bilim Kurgu</option>
                                <option value="Kişisel Gelişim">Kişisel Gelişim</option>
                                <option value="Tarih">Tarih</option>
                                <option value="Akademik / Ders">Akademik / Ders</option>
                                <option value="Çocuk & Gençlik">Çocuk & Gençlik</option>
                            </select>
                        </div>
                        <div style="display:grid; grid-template-columns: 1fr 1fr; gap:0.75rem;">
                            <div class="form-group">
                                <label>Stok Adedi</label>
                                <input type="number" id="bookStock" class="form-control" min="0" value="5" required>
                            </div>
                            <div class="form-group">
                                <label>Satış Fiyatı (₺)</label>
                                <input type="number" id="bookPrice" class="form-control" min="1" step="0.5" placeholder="180" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Raf / Reyon Notu (İsteğe Bağlı)</label>
                            <input type="text" id="bookShelf" class="form-control" placeholder="Örn: A-3 Rafı">
                        </div>
                        <button type="submit" class="btn btn-primary">Kitabı Dükkana Ekle</button>
                    </form>
                </div>

                <!-- Sağ: Dükkandaki Kitaplar Tablosu -->
                <div class="panel-card">
                    <h2>📦 Dükkanımdaki Kitaplar ve Stok Yönetimi</h2>
                    <div class="table-responsive">
                        <table>
                            <thead>
                                <tr>
                                    <th>Kitap & Yazar</th>
                                    <th>Kategori / Raf</th>
                                    <th>Stok Durumu</th>
                                    <th>Fiyat (₺)</th>
                                    <th>İşlem</th>
                                </tr>
                            </thead>
                            <tbody id="ownerBooksTable"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>

        <!-- 3. KULLANICI KİTAP ARAMA VE LİSTELEME EKRANI -->
        <section id="userSection" class="hidden">
            <div class="search-bar">
                <input type="text" id="searchInput" class="form-control" placeholder="🔍 Kitap adı, yazar veya dükkan adı ara..." oninput="renderUserBooks()">
                
                <select id="categoryFilter" class="form-control" onchange="renderUserBooks()">
                    <option value="all">Tüm Kategoriler</option>
                    <option value="Roman">Roman</option>
                    <option value="Bilim Kurgu">Bilim Kurgu</option>
                    <option value="Kişisel Gelişim">Kişisel Gelişim</option>
                    <option value="Tarih">Tarih</option>
                    <option value="Akademik / Ders">Akademik / Ders</option>
                    <option value="Çocuk & Gençlik">Çocuk & Gençlik</option>
                </select>

                <select id="sortFilter" class="form-control" onchange="renderUserBooks()">
                    <option value="default">Sıralama: Önerilen</option>
                    <option value="priceAsc">Fiyat: En Ucuzdan</option>
                    <option value="priceDesc">Fiyat: En Pahalıdan</option>
                    <option value="stockDesc">Stok: En Çoktan</option>
                </select>

                <label style="display:flex; align-items:center; gap:0.45rem; font-size:0.88rem; font-weight:600; cursor:pointer; white-space:nowrap;">
                    <input type="checkbox" id="onlyInStock" onchange="renderUserBooks()" style="width:16px; height:16px;">
                    Sadece Stokta Olanlar
                </label>
            </div>

            <div id="booksGrid" class="books-grid"></div>
        </section>
    </main>

    <script>
        // Varsayılan Başlangıç Verileri (İlk açılışta localStorage boşsa yüklenir)
        const DEFAULT_USERS = [
            {
                id: 'u1',
                name: 'Ahmet Yılmaz',
                email: 'kullanici@demo.com',
                password: '1234',
                role: 'user'
            },
            {
                id: 's1',
                name: 'Mehmet Kaya',
                email: 'dukkan@demo.com',
                password: '1234',
                role: 'owner',
                shopName: 'Kاردelen Kitap & Kırtasiye',
                shopAddress: 'Terme Cad. No: 24 Merkez | Tel: 0386 213 00 11'
            },
            {
                id: 's2',
                name: 'Zeynep Demir',
                email: 'zeynep@demo.com',
                password: '1234',
                role: 'owner',
                shopName: 'Ahi Sahaf & Kitabevi',
                shopAddress: 'Ankara Cad. Kültür Pasajı No: 8 | Tel: 0386 214 55 44'
            }
        ];

        const DEFAULT_BOOKS = [
            {
                id: 'b1',
                ownerId: 's1',
                shopName: 'Kardelen Kitap & Kırtasiye',
                shopAddress: 'Terme Cad. No: 24 Merkez | Tel: 0386 213 00 11',
                title: 'Olasılıksız',
                author: 'Adam Fawer',
                category: 'Bilim Kurgu',
                stock: 7,
                price: 215,
                shelf: 'B-2 Rafı'
            },
            {
                id: 'b2',
                ownerId: 's2',
                shopName: 'Ahi Sahaf & Kitabevi',
                shopAddress: 'Ankara Cad. Kültür Pasajı No: 8 | Tel: 0386 214 55 44',
                title: 'Olasılıksız',
                author: 'Adam Fawer',
                category: 'Bilim Kurgu',
                stock: 2,
                price: 190,
                shelf: 'Giriş Sol Reyon'
            },
            {
                id: 'b3',
                ownerId: 's1',
                shopName: 'Kardelen Kitap & Kırtasiye',
                shopAddress: 'Terme Cad. No: 24 Merkez | Tel: 0386 213 00 11',
                title: 'Yeni Hayat',
                author: 'Orhan Pamuk',
                category: 'Roman',
                stock: 4,
                price: 165,
                shelf: 'A-1 Rafı'
            },
            {
                id: 'b4',
                ownerId: 's2',
                shopName: 'Ahi Sahaf & Kitabevi',
                shopAddress: 'Ankara Cad. Kültür Pasajı No: 8 | Tel: 0386 214 55 44',
                title: 'Kürk Mantolu Madonna',
                author: 'Sabahattin Ali',
                category: 'Roman',
                stock: 12,
                price: 85,
                shelf: 'C-4 Rafı'
            },
            {
                id: 'b5',
                ownerId: 's2',
                shopName: 'Ahi Sahaf & Kitabevi',
                shopAddress: 'Ankara Cad. Kültür Pasajı No: 8 | Tel: 0386 214 55 44',
                title: 'Süpermen Türk Olsaydı',
                author: 'Ahmet Şerif İzgören',
                category: 'Kişisel Gelişim',
                stock: 0,
                price: 140,
                shelf: 'D-1 Rafı'
            }
        ];

        let users = [];
        let books = [];
        let currentUser = null;
        let selectedRegisterRole = 'user';
        let ownerViewingSearch = false;

        // Uygulama Başlatma
        function initApp() {
            const storedUsers = localStorage.getItem('kb_users');
            const storedBooks = localStorage.getItem('kb_books');
            const storedSession = localStorage.getItem('kb_session');

            users = storedUsers ? JSON.parse(storedUsers) : DEFAULT_USERS;
            books = storedBooks ? JSON.parse(storedBooks) : DEFAULT_BOOKS;

            saveData();

            if (storedSession) {
                currentUser = JSON.parse(storedSession);
                routeUser();
            }
        }

        function saveData() {
            localStorage.setItem('kb_users', JSON.stringify(users));
            localStorage.setItem('kb_books', JSON.stringify(books));
        }

        // Giriş / Kayıt Sekme Geçişi
        function switchAuthTab(tab) {
            hideAlert('authAlert');
            const isLogin = tab === 'login';
            document.getElementById('tabLogin').classList.toggle('active', isLogin);
            document.getElementById('tabRegister').classList.toggle('active', !isLogin);
            document.getElementById('loginForm').classList.toggle('hidden', !isLogin);
            document.getElementById('registerForm').classList.toggle('hidden', isLogin);
        }

        // Kayıt Olurken Rol Seçimi
        function selectRole(role) {
            selectedRegisterRole = role;
            document.getElementById('roleUserLabel').classList.toggle('selected', role === 'user');
            document.getElementById('roleOwnerLabel').classList.toggle('selected', role === 'owner');

            const shopFields = document.getElementById('shopExtraFields');
            const shopNameInput = document.getElementById('regShopName');
            const shopAddrInput = document.getElementById('regShopAddress');

            if (role === 'owner') {
                shopFields.classList.remove('hidden');
                shopNameInput.required = true;
                shopAddrInput.required = true;
            } else {
                shopFields.classList.add('hidden');
                shopNameInput.required = false;
                shopAddrInput.required = false;
            }
        }

        // Kayıt İşlemi
        function handleRegister(e) {
            e.preventDefault();
            const name = document.getElementById('regName').value.trim();
            const email = document.getElementById('regEmail').value.trim().toLowerCase();
            const password = document.getElementById('regPassword').value;
            const shopName = document.getElementById('regShopName').value.trim();
            const shopAddress = document.getElementById('regShopAddress').value.trim();

            if (users.some(u => u.email === email)) {
                showAlert('authAlert', 'Bu e-posta adresi zaten kayıtlı!', 'error');
                return;
            }

            const newUser = {
                id: 'u_' + Date.now(),
                name,
                email,
                password,
                role: selectedRegisterRole,
                shopName: selectedRegisterRole === 'owner' ? shopName : null,
                shopAddress: selectedRegisterRole === 'owner' ? shopAddress : null
            };

            users.push(newUser);
            saveData();

            currentUser = newUser;
            localStorage.setItem('kb_session', JSON.stringify(currentUser));
            routeUser();
        }

        // Giriş İşlemi
        function handleLogin(e) {
            e.preventDefault();
            const email = document.getElementById('loginEmail').value.trim().toLowerCase();
            const password = document.getElementById('loginPassword').value;

            const found = users.find(u => u.email === email && u.password === password);
            if (!found) {
                showAlert('authAlert', 'Hatalı e-posta veya şifre girdiniz.', 'error');
                return;
            }

            currentUser = found;
            localStorage.setItem('kb_session', JSON.stringify(currentUser));
            routeUser();
        }

        // Tek Tıkla Demo Girişi
        function quickLogin(role) {
            const targetEmail = role === 'owner' ? 'dukkan@demo.com' : 'kullanici@demo.com';
            const found = users.find(u => u.email === targetEmail);
            if (found) {
                currentUser = found;
                localStorage.setItem('kb_session', JSON.stringify(currentUser));
                routeUser();
            }
        }

        // Çıkış İşlemi
        function logout() {
            currentUser = null;
            ownerViewingSearch = false;
            localStorage.removeItem('kb_session');
            document.getElementById('userBar').classList.add('hidden');
            document.getElementById('ownerSection').classList.add('hidden');
            document.getElementById('userSection').classList.add('hidden');
            document.getElementById('authSection').classList.remove('hidden');
        }

        // Kullanıcı Rolüne Göre Ekran Yönlendirme
        function routeUser() {
            document.getElementById('authSection').classList.add('hidden');
            document.getElementById('userBar').classList.remove('hidden');

            document.getElementById('welcomeText').textContent = currentUser.name;
            const badge = document.getElementById('roleBadge');
            const toggleBtn = document.getElementById('toggleViewBtn');

            if (currentUser.role === 'owner') {
                badge.textContent = '🏪 Dükkan Sahibi';
                badge.classList.add('owner');
                toggleBtn.classList.remove('hidden');
                ownerViewingSearch = false;
                toggleBtn.textContent = '🔍 Tüm Dükkanlarda Ara';
                document.getElementById('ownerSection').classList.remove('hidden');
                document.getElementById('userSection').classList.add('hidden');
                renderOwnerDashboard();
            } else {
                badge.textContent = '👤 Kitapsever';
                badge.classList.remove('owner');
                toggleBtn.classList.add('hidden');
                document.getElementById('ownerSection').classList.add('hidden');
                document.getElementById('userSection').classList.remove('hidden');
                renderUserBooks();
            }
        }

        // Dükkan Sahibinin Arama Ekranına Geçişi
        function toggleOwnerSearchView() {
            ownerViewingSearch = !ownerViewingSearch;
            const toggleBtn = document.getElementById('toggleViewBtn');

            if (ownerViewingSearch) {
                toggleBtn.textContent = '🏪 Dükkan Paneline Dön';
                document.getElementById('ownerSection').classList.add('hidden');
                document.getElementById('userSection').classList.remove('hidden');
                renderUserBooks();
            } else {
                toggleBtn.textContent = '🔍 Tüm Dükkanlarda Ara';
                document.getElementById('userSection').classList.add('hidden');
                document.getElementById('ownerSection').classList.remove('hidden');
                renderOwnerDashboard();
            }
        }

        // Dükkan Sahibi: Kitap Ekleme
        function handleAddBook(e) {
            e.preventDefault();
            const title = document.getElementById('bookTitle').value.trim();
            const author = document.getElementById('bookAuthor').value.trim();
            const category = document.getElementById('bookCategory').value;
            const stock = parseInt(document.getElementById('bookStock').value, 10);
            const price = parseFloat(document.getElementById('bookPrice').value);
            const shelf = document.getElementById('bookShelf').value.trim() || 'Belirtilmedi';

            const newBook = {
                id: 'b_' + Date.now(),
                ownerId: currentUser.id,
                shopName: currentUser.shopName,
                shopAddress: currentUser.shopAddress,
                title,
                author,
                category,
                stock,
                price,
                shelf
            };

            books.unshift(newBook);
            saveData();
            e.target.reset();
            document.getElementById('bookStock').value = 5;

            showAlert('ownerAlert', `"${title}" başarıyla dükkan envanterine eklendi!`, 'success');
            renderOwnerDashboard();
        }

        // Dükkan Sahibi: Stok Güncelleme
        function changeStock(bookId, delta) {
            const book = books.find(b => b.id === bookId && b.ownerId === currentUser.id);
            if (!book) return;

            book.stock = Math.max(0, book.stock + delta);
            saveData();
            renderOwnerDashboard();
        }

        // Dükkan Sahibi: Fiyat Güncelleme
        function updatePrice(bookId, newPrice) {
            const parsed = parseFloat(newPrice);
            if (isNaN(parsed) || parsed <= 0) return;

            const book = books.find(b => b.id === bookId && b.ownerId === currentUser.id);
            if (book) {
                book.price = parsed;
                saveData();
            }
        }

        // Dükkan Sahibi: Kitap Silme
        function deleteBook(bookId) {
            books = books.filter(b => !(b.id === bookId && b.ownerId === currentUser.id));
            saveData();
            renderOwnerDashboard();
        }

        // Dükkan Sahibi Panelini Çiz
        function renderOwnerDashboard() {
            const myBooks = books.filter(b => b.ownerId === currentUser.id);
            const totalStock = myBooks.reduce((sum, b) => sum + b.stock, 0);

            document.getElementById('statShopName').textContent = currentUser.shopName;
            document.getElementById('statBookTypes').textContent = myBooks.length;
            document.getElementById('statTotalStock').textContent = totalStock;

            const tbody = document.getElementById('ownerBooksTable');
            if (myBooks.length === 0) {
                tbody.innerHTML = `<tr><td colspan="5" style="text-align:center; padding:2rem; color:#64748b;">Henüz dükkanınıza kitap eklemediniz. Sol taraftaki formdan ekleyebilirsiniz.</td></tr>`;
                return;
            }

            tbody.innerHTML = myBooks.map(book => `
                <tr>
                    <td>
                        <strong style="display:block; color:#0f172a;">${escapeHtml(book.title)}</strong>
                        <span style="font-size:0.82rem; color:#64748b;">${escapeHtml(book.author)}</span>
                    </td>
                    <td>
                        <span class="category-tag">${escapeHtml(book.category)}</span>
                        <div style="font-size:0.78rem; color:#64748b; margin-top:4px;">📍 ${escapeHtml(book.shelf)}</div>
                    </td>
                    <td>
                        <div class="stock-control">
                            <button class="stock-btn" onclick="changeStock('${book.id}', -1)">-</button>
                            <span style="min-width:26px; text-align:center; font-weight:700; color:${book.stock > 0 ? '#065f46' : '#991b1b'};">${book.stock}</span>
                            <button class="stock-btn" onclick="changeStock('${book.id}', 1)">+</button>
                        </div>
                    </td>
                    <td>
                        <input type="number" class="form-control" style="width:95px; padding:0.35rem 0.5rem;" value="${book.price}" min="1" step="0.5" onchange="updatePrice('${book.id}', this.value)">
                    </td>
                    <td>
                        <button class="btn btn-danger" onclick="deleteBook('${book.id}')">Sil</button>
                    </td>
                </tr>
            `).join('');
        }

        // Kullanıcı: Kitapları Filtrele ve Listele
        function renderUserBooks() {
            const query = document.getElementById('searchInput').value.trim().toLowerCase();
            const category = document.getElementById('categoryFilter').value;
            const sort = document.getElementById('sortFilter').value;
            const onlyInStock = document.getElementById('onlyInStock').checked;

            let filtered = books.filter(b => {
                const matchesQuery =
                    b.title.toLowerCase().includes(query) ||
                    b.author.toLowerCase().includes(query) ||
                    b.shopName.toLowerCase().includes(query);
                const matchesCategory = category === 'all' || b.category === category;
                const matchesStock = !onlyInStock || b.stock > 0;
                return matchesQuery && matchesCategory && matchesStock;
            });

            if (sort === 'priceAsc') filtered.sort((a, b) => a.price - b.price);
            if (sort === 'priceDesc') filtered.sort((a, b) => b.price - a.price);
            if (sort === 'stockDesc') filtered.sort((a, b) => b.stock - a.stock);

            const grid = document.getElementById('booksGrid');
            if (filtered.length === 0) {
                grid.innerHTML = `
                    <div class="empty-state">
                        <h3>Aradığınız kriterlere uygun kitap bulunamadı.</h3>
                        <p style="margin-top:0.4rem;">Farklı bir kitap adı yazabilir veya filtreleri temizleyebilirsiniz.</p>
                    </div>
                `;
                return;
            }

            grid.innerHTML = filtered.map(book => `
                <div class="book-card">
                    <div>
                        <div class="book-header">
                            <span class="category-tag">${escapeHtml(book.category)}</span>
                            <span class="stock-badge ${book.stock > 0 ? 'stock-in' : 'stock-out'}">
                                ${book.stock > 0 ? `Stokta: ${book.stock} Adet` : 'Tükendi'}
                            </span>
                        </div>
                        <div class="book-title">${escapeHtml(book.title)}</div>
                        <div class="book-author">✍️ ${escapeHtml(book.author)}</div>

                        <div class="shop-info">
                            <strong>🏪 ${escapeHtml(book.shopName)}</strong>
                            <p>📍 ${escapeHtml(book.shopAddress)}</p>
                            <p>🗂️ Raf/Reyon: ${escapeHtml(book.shelf || 'Belirtilmedi')}</p>
                        </div>
                    </div>

                    <div class="book-footer">
                        <span style="font-size:0.82rem; color:#64748b; font-weight:600;">Dükkan Satış Fiyatı</span>
                        <span class="price-tag">${book.price.toFixed(2)} ₺</span>
                    </div>
                </div>
            `).join('');
        }

        // Yardımcı Fonksiyonlar
        function showAlert(id, message, type) {
            const el = document.getElementById(id);
            el.textContent = message;
            el.className = `alert ${type === 'error' ? 'alert-error' : 'alert-success'}`;
            el.classList.remove('hidden');
            setTimeout(() => el.classList.add('hidden'), 3500);
        }

        function hideAlert(id) {
            document.getElementById(id).classList.add('hidden');
        }

        function escapeHtml(str) {
            return String(str)
                .replace(/&/g, '&amp;')
                .replace(/</g, '&lt;')
                .replace(/>/g, '&gt;')
                .replace(/"/g, '&quot;');
        }

        initApp();
    </script>
</body>
</html>
İstersen bu yapıya kullanıcılar için kitap ayırtma (rezervasyon) veya dükkan konumunu haritada gösterme özelliği de ekleyebilirim; hangisini dahil edelim?

BEN NE YAPTIM:
yapay  zeka siteye test modu da eklemişti. ben de test moduyla ilgili kodları kaldırdım. kalan kodları olduğu gibi yapıştırdım.
