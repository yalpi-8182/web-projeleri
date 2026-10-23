-- Kırşehir Kitap & Kırtasiye Portalı Veritabanı Şeması
-- SQLite / PostgreSQL Uyumlu DDL

CREATE TABLE IF NOT EXISTS users (
    id VARCHAR(50) PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    name VARCHAR(150) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('reader', 'store', 'admin')),
    email VARCHAR(150) UNIQUE NOT NULL,
    store_id VARCHAR(50) REFERENCES stores(id) ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS stores (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    district VARCHAR(100) NOT NULL, -- Cacabey Meydanı, Terme Cad., Lise Cad., Bağbaşı
    address TEXT NOT NULL,
    phone VARCHAR(50) NOT NULL,
    store_type VARCHAR(50) NOT NULL, -- Kitapçı, Kırtasiye, Kitap & Kırtasiye
    bio TEXT,
    owner_user_id VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS books (
    id VARCHAR(50) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(200) NOT NULL,
    isbn VARCHAR(50) UNIQUE NOT NULL,
    publisher VARCHAR(150),
    category VARCHAR(100) NOT NULL,
    publication_year INTEGER,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS inventory (
    id VARCHAR(50) PRIMARY KEY,
    store_id VARCHAR(50) NOT NULL REFERENCES stores(id) ON DELETE CASCADE,
    book_id VARCHAR(50) NOT NULL REFERENCES books(id) ON DELETE CASCADE,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INTEGER NOT NULL DEFAULT 0,
    item_condition VARCHAR(20) NOT NULL DEFAULT 'Sıfır',
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(store_id, book_id)
);

CREATE TABLE IF NOT EXISTS favorites (
    id VARCHAR(50) PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    book_id VARCHAR(50) NOT NULL REFERENCES books(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, book_id)
);

CREATE INDEX IF NOT EXISTS idx_books_title ON books(title);
CREATE INDEX IF NOT EXISTS idx_inventory_store ON inventory(store_id);
CREATE INDEX IF NOT EXISTS idx_inventory_book ON inventory(book_id);
CREATE INDEX IF NOT EXISTS idx_favorites_user ON favorites(user_id);
