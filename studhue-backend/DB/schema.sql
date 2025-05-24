CREATE TABLE IF NOT EXISTS Users (
  user_ID TEXT PRIMARY KEY,
  email TEXT UNIQUE,
  first_name TEXT,
  last_name TEXT,
  username TEXT UNIQUE,
  age INTEGER,
  birthdate TEXT,           -- Store dates as ISO8601 string
  address TEXT,
  phone_number TEXT,        -- Store phone as text to preserve leading zeros
  password TEXT,
  account_date_creation TEXT
);

CREATE TABLE IF NOT EXISTS Followers (
  follower_id TEXT,
  following_id TEXT,
  PRIMARY KEY (follower_id, following_id),
  FOREIGN KEY (follower_id) REFERENCES Users(user_ID),
  FOREIGN KEY (following_id) REFERENCES Users(user_ID)
);

CREATE TABLE IF NOT EXISTS Posts (
  post_id TEXT PRIMARY KEY,
  user_id TEXT,
  caption TEXT,
  post_type TEXT,
  post_date TEXT,
  FOREIGN KEY (user_id) REFERENCES Users(user_ID)
);

CREATE TABLE IF NOT EXISTS Pinboards (
  board_ID TEXT PRIMARY KEY,
  user_id TEXT,
  board_name TEXT,
  board_description TEXT,
  board_date_creation TEXT,
  FOREIGN KEY (user_id) REFERENCES Users(user_ID)
);

CREATE TABLE IF NOT EXISTS Pinboard_Posts (
  board_ID TEXT,
  post_ID TEXT,
  PRIMARY KEY (board_ID, post_ID),
  FOREIGN KEY (board_ID) REFERENCES Pinboards(board_ID),
  FOREIGN KEY (post_ID) REFERENCES Posts(post_ID)
);

CREATE TABLE IF NOT EXISTS Products (
  product_id TEXT PRIMARY KEY,
  user_id TEXT,
  post_id TEXT,
  product_name TEXT,
  details TEXT,
  stock_quantity INTEGER,
  price REAL,
  FOREIGN KEY (user_id) REFERENCES Users(user_ID),
  FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);

CREATE TABLE IF NOT EXISTS Product_Variations (
  variation_id TEXT PRIMARY KEY,
  product_id TEXT,
  variation_name TEXT,
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE IF NOT EXISTS Orders (
  order_id TEXT PRIMARY KEY,
  user_id TEXT,
  order_status TEXT,
  total_amount REAL,
  address TEXT,
  date_placed TEXT,
  FOREIGN KEY (user_id) REFERENCES Users(user_ID)
);

CREATE TABLE IF NOT EXISTS Order_Items (
  order_item_id TEXT PRIMARY KEY,
  order_id TEXT,
  product_id TEXT,
  variation_id TEXT,
  quantity INTEGER,
  price_each REAL,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id),
  FOREIGN KEY (variation_id) REFERENCES Product_Variations(variation_id)
);
