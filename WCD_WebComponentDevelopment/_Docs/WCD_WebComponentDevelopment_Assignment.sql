# Created_by: Hieu_iceTea
# Created_at: 09:15 2021-06-01
# Updated_at: 09:30 2021-06-01

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                           Create DataBase                                           #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

DROP DATABASE IF EXISTS `WCD_WebComponentDevelopment`;
CREATE DATABASE IF NOT EXISTS `WCD_WebComponentDevelopment` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

USE `WCD_WebComponentDevelopment`;

SET time_zone = '+07:00';
ALTER DATABASE `WCD_WebComponentDevelopment` CHARACTER SET utf8 COLLATE utf8_unicode_ci;

# SET SQL_MODE = 'ALLOW_INVALID_DATES';


# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                            Create Tables                                            #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# Create Table user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user`
(
    `id`                  INT AUTO_INCREMENT,

    `username`           VARCHAR(64) UNIQUE NOT NULL,
    `email`               VARCHAR(64) UNIQUE NOT NULL,
    `password`            VARCHAR(128)       NOT NULL,
    `level`               TINYINT UNSIGNED   NOT NULL,

    `image`               VARCHAR(128),
    `gender`              BOOLEAN,
    `firstname`          VARCHAR(64),
    `lastname`           VARCHAR(64),
    `phone`               VARCHAR(16),
    `address`             VARCHAR(128),

    `active`              BOOLEAN      DEFAULT FALSE,

    `created_by`          NVARCHAR(32) DEFAULT 'Hieu_iceTea',
    `created_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`          NVARCHAR(32) DEFAULT NULL,
    `updated_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`             INT          DEFAULT 1,
    `deleted`             BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;

# Create Table product
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product`
(
    `id`                  INT AUTO_INCREMENT,

    `product_category_id` INT UNSIGNED               NOT NULL,
    `restaurant_id`       INT UNSIGNED               NOT NULL,

    `name`                VARCHAR(128)               NOT NULL,
    `ingredients`         VARCHAR(256)               NOT NULL,
    `price`               DECIMAL(16, 2) UNSIGNED    NOT NULL,
    `image`               VARCHAR(128),
    `country`             VARCHAR(32),
    `tag`                 VARCHAR(128),
    `description`         TEXT,
    `featured`            BOOLEAN      DEFAULT FALSE NOT NULL,

    `created_by`          NVARCHAR(32) DEFAULT 'Hieu_iceTea',
    `created_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`          NVARCHAR(32) DEFAULT NULL,
    `updated_at`          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`             INT          DEFAULT 1,
    `deleted`             BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;


# Create Table product_category
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE IF NOT EXISTS `product_category`
(
    `id`         INT AUTO_INCREMENT,

    `name`       VARCHAR(64) NOT NULL,
    `image`      CHAR(128)   NOT NULL,
    `active`     BOOLEAN      DEFAULT TRUE,

    `created_by` NVARCHAR(32) DEFAULT 'Hieu_iceTea',
    `created_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by` NVARCHAR(32) DEFAULT NULL,
    `updated_at` TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`    INT          DEFAULT 1,
    `deleted`    BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;

# Create Table restaurant
DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE IF NOT EXISTS `restaurant`
(
    `id`          INT AUTO_INCREMENT,

    `name`        VARCHAR(64),
    `image`       CHAR(128),
    `address`     VARCHAR(64),
    `description` TEXT,

    `created_by`  NVARCHAR(32) DEFAULT 'Hieu_iceTea',
    `created_at`  TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `updated_by`  NVARCHAR(32) DEFAULT NULL,
    `updated_at`  TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    `version`     INT          DEFAULT 1,
    `deleted`     BOOLEAN      DEFAULT FALSE,

    PRIMARY KEY (`id`)
) ENGINE InnoDB;

# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #
#                                             Insert Data                                             #
# = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = #

# Default password: 123456

INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (15, 'ThiDK', 'ThiDK@fpt.edu.vn ', '123456', 4, 'ThiDK.jpg', 2, 'Đặng Kim', 'Thi', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (14, 'Hieu_iceTea', 'DinhHieu8896@gmail.com', '123456', 4, 'Hieu_iceTea.jpg', 1, 'Nguyễn Đình', 'Hiếu', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (13, 'DinhHieu8896', 'HieuNDTH1908028@fpt.edu.vn', '123456', 4, 'DinhHieu8896.jpg', 1, 'Nguyễn Đình', 'Hiếu', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (12, 'HungNPMTH1908050', 'HungNPMTH1908050@fpt.edu.vn', '123456', 4, 'HungNPMTH1908050.jpg', 1, 'Nông Phan Mạnh', 'Hùng', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (11, 'HuyVQTH1909003', 'HuyVQTH1909003@fpt.edu.vn', '123456', 4, 'HuyVQTH1909003.jpg', 1, 'Vũ Quang', 'Huy', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (10, 'AnhNTTH1908059', 'AnhNTTH1908059@fpt.edu.vn', '123456', 4, 'AnhNTTH1908059.jpg', 1, 'Nguyễn Trung', 'Anh', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (9, 'HoaDTCTH1909001', 'HoaDTCTH1909001@fpt.edu.vn', '123456', 4, 'HoaDTCTH1909001.jpg', 1, 'Đỗ Thị Chan', 'Hòa', '098 115 9826', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (8, 'VuHVTH1908054', 'VuHVTH1908054@fpt.edu.vn', '123456', 4, 'VuHVTH1908054.jpg', 1, 'Hà Văn', 'Vũ', '082 589 4329', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (7, 'Customer', 'codedy.demo@gmail.com', '123456', 4, 'customer.jpg', 1, 'CODEDY', 'Customer', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (6, 'Staff_C', 'staff_c.codedy@gmail.com', '123456', 3, 'staff_c.jpg', 1, 'CODEDY', 'Staff C', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (5, 'Staff_B', 'staff_b.codedy@gmail.com', '123456', 3, 'staff_b.jpg', 2, 'CODEDY', 'Staff B', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (4, 'Staff_A', 'staff_a.codedy@gmail.com', '123456', 3, 'staff_a.jpg', 1, 'CODEDY', 'Staff A', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (3, 'Admin_Demo', 'admin_demo.codedy@gmail.com', '123456', 2, 'admin_demo.jpg', 1, 'CODEDY', 'Admin Demo', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', FALSE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (2, 'Admin', 'admin.codedy@gmail.com', '123456', 2, 'admin.jpg', 1, 'CODEDY', 'Admin', '0868 6633 15', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);
INSERT INTO user (id, username, email, password, level, image, gender, firstname, lastname, phone, address, active)
VALUE (1, 'Host', 'host.codedy@gmail.com', '123456', 1, 'host.jpg', 1, 'CODEDY', 'Host', '032 87 99 000', '8, Ton That Thuyet, Ha Noi, Viet Nam', TRUE);


INSERT INTO product_category (Id, Name, Image, Active)
VALUE (1, 'Vegetarian', 'Vegetarian.jpg', TRUE);
INSERT INTO product_category (Id, Name, Image, Active)
VALUE (2, 'Vegan', 'Vegan.jpg', TRUE);
INSERT INTO product_category (Id, Name, Image, Active)
VALUE (3, 'Chinese', 'Chinese.jpg', TRUE);
INSERT INTO product_category (Id, Name, Image, Active)
VALUE (4, 'Mexican', 'Mexican.jpg', TRUE);
INSERT INTO product_category (Id, Name, Image, Active)
VALUE (5, 'Burgers', 'menu-title-burgers.jpg', TRUE);
INSERT INTO product_category (Id, Name, Image, Active)
VALUE (6, 'Pasta', 'menu-title-pasta.jpg', TRUE);
INSERT INTO product_category (Id, Name, Image, Active)
VALUE (7, 'Pizza', 'menu-title-pizza.jpg', TRUE);
INSERT INTO product_category (Id, Name, Image, Active)
VALUE (8, 'Sushi', 'menu-title-sushi.jpg', TRUE);
INSERT INTO product_category (Id, Name, Image, Active)
VALUE (9, 'Desserts', 'menu-title-desserts.jpg', TRUE);
INSERT INTO product_category (Id, Name, Image, Active)
VALUE (10, 'Drinks', 'menu-title-drinks.jpg', TRUE);


INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (1, 1, 1, 'Best Lentil Soup', 'Includes vegetables and flour',10.59, 'Best Lentil Soup.jpg', 'Viet Nam', 'Snacks', 'My lentil soup is made with most of the ingredients in the pantry but includes hearty greens and a squeeze of lemon for a fresh flavor. It is seasoned with a few of my spices and lots of freshly ground black pepper', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (2, 1, 1, 'Crispy Baked Falafel', 'Includes several healthy vegetables',13.89, 'Crispy Baked Falafel.jpg', 'American', 'Lunch', 'No kidding! If you are a mom of a picky eater or someone constantly worried about including various veggies in your family’s diet and hoping to relish the goodness of all vegetables in one go – pick vegetable flours.', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (3, 1, 1, 'Peanut Slaw with Soba Noodles', 'cabbage, carrots, scallions, peanut butter',18.39, 'Peanut Slaw with Soba Noodles.jpg', 'Viet Nam', 'Snacks', 'Its spicy (mild). It is beans and pasta. It is a friend of all vegetables. Its a salad ... not really a salad. It has a crunchy flavor from soft drinks and juices, and its extremely water-free and a mixture of carbs called soba noodles, and its also colorful and crunchy and fresh, so its the same.', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (4, 1, 1, 'Black Bean Sweet Potato Enchiladas', 'Include black beans, sweet potatoes and some special spices',15.29, 'Black Bean Sweet Potato Enchiladas.jpg', 'Japan', 'Breakfast', 'This is a delicious vegetarian dish that will suit everyone, with the black beans and sweet potatoes combined to make the black Bean Sweet Potato Enchiladas. This dish is easy to eat so we thought it would be a dish suitable for everyone', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (5, 1, 1, 'Spaghetti Squash Burrito Bowls', 'pumpkin, olive oil, monosodium glutamate and chili powder',16.39, 'Spaghetti Squash Burrito Bowls.jpg', 'American', 'Snacks', 'This is a dish with all vegetable ingredients so it will be very suitable for those on a diet, although this is also a dish full of nutrients. I look forward to you coming to our store or ordering it online to try our food', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (6, 1, 1, 'Spicy Sweet Potato', 'The main ingredient is sweet potato',12.89, 'Spicy Sweet Potato.jpg', 'ThaiLan', 'Lunch', 'Spicy roasted sweet potatoes make a great treat for chicken, pork or beef and they also taste great when combined with eggs, making for an easy breakfast. Try tossing leftovers into a green leaf salad with some feta cheese. I recommend you to try this one once because of its special taste', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (7, 2, 2, 'Vegan Eggplant Salad', 'Peppers, garlic, fresh herbs, lemon juice',10.59, 'engg.jpg', 'Viet Nam', 'Dinner', 'Grilled aubergine salad with chickpeas and tomato is a recipe inspired by Mediterranean flavors. Its vegan, gluten-free and healthy. This is also a dish recommended by nutrition experts because it is full of nutrients', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (8, 2, 2, 'Vegan Potato Salad', 'Potatoes, tomatoes, onions, peppers, herbs, house spices, and olive oil.',13.89, 'vegan.jpg', 'Viet Nam', 'Dinner', 'this vegan potato salad is a must for your summer picnics and parties! A flavorful dressing, dill pickles, and crunchy celery and onion make this recipe a favorite. ', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (9, 2, 2, 'Vegan Onion Rings', 'Carrots, cabbage, onions, olive oil',18.39, 'onion.jpg', 'Viet Nam', 'Snacks', 'You will love these vegan onion rings! They are extremely crunchy and delicious. Plus, theyre baked in the oven, making them much healthier than fried onion slices. This dish will also be very attractive to your children', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (10, 2, 2, 'Vegan Hummus with Pita', 'cucumber, tomato, red wine vinegar, salt and black pepper',15.29, 'VeganHummus.jpg', 'Viet Nam', 'Snacks', 'Im not lying when I say that this is a best-selling sandwich in our store. I was skeptical when I saw no cheese or meat in the recipe - how could it really be called a sandwich without those two ?? Thats a completely dumb thought of mine. It turns out that not only can it be called a sandwich, it can be called an absolutely amazing!', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (11, 2, 2, 'Vegan Spicy Falafel Wrap', 'Onions, cilantro, parsley, and tahini',16.39, 'Veganpicy.jpg', 'Viet Nam', 'Breakfast', 'This Spicy Vegan Falafel Wrap is an Indian version of very famous middle eastern street food falafel wrap. To give the Indian touch to traditional vegan falafel wrap, we have added some more spices to make it more aromatic and spicy. The falafel wrap recipe using the very basic ingredients of chickpeas, cilantro, onions, garlic, cumins, in addition we have added peppercorns, cinnamon, cloves and cayenne (red chili powder) to add to the spice.', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (12, 2, 2, 'Original Acai Bowl', 'granola, fresh banana, blueberries and strawberries',12.89, 'original.jpg', 'Chinese', 'Breakfast', 'Introducing Acai Smoothie Bowls , a frozen smoothie blend topped with tangy fruit and crunchy granola. With delectable flavors and non-GMO ingredients, its a light and refreshing snack you can take anywhere. Our Acai Original Frozen Smoothie Bowl features a refreshing blend of  bananas, and honey topped with strawberries, blueberries, honey oat granola, and coconut. With only 210 calories, its the perfect snack for any time of day. Just grab, thaw and enjoy!', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (13, 3, 3, 'Minced Pork on Rice', 'Rice, Pork, Green onion, Soup',10.59, 'minced-pork-on-rice.jpg', 'China', 'Breakfast', 'This dish is based on one of Taiwans most loved comfort foods, though adapted it using more common kitchen ingredients. Feel free to substitute with your choice of meat. Serve over rice / noodles or cauliflower rice for a low carb option and enjoy.', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (14, 3, 3, 'Wonton Noodle Soup', 'rice flour, vegetables, minced meat, soup',13.89, 'wonton-noodle-soup.jpg', 'Viet Nam', 'Snacks', 'Cantonese Wonton Noodles is a basic, indisputable noodle that you will find at most Cantonese restaurant. But if you are not near Chinatown or the Cantonese location, you will definitely want to try this at our restaurant. Its easy to put together. If you are interested in this dish then you come to our store or order one of our to try it', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (15, 3, 3, 'Chiayi Chicken Rice', 'Jidori chicken, shallot oil, house pickles,
garnished with scallions. Gluten Free',18.39, 'chiayi-chicken-rice.jpg', 'Korean', 'Lunch', 'Taiwanese chicken rice originated from Chiayi, a city in the southern part of Taiwan.  Traditionally its made with turkey, as its cheaper and more available back in the day.  If you visit Chiayi in Taiwan, you will see restaurant and food stalls selling turkey/chicken rice every where. In its appearance, this dish is deceptively simple -- seemingly just a bowl of white rice topped with some shredded chicken and sauce.  The flavor, however, will surprise you with its depth and savoriness.  If you like Taiwanese braised pork rice (Lu Rou Fan), then you must try this chicken rice.  To me, they are equally delicious and addictive.  I always end up eating more whenever I made this chicken rice!', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (16, 3, 3, 'Slack Season Noodles', 'Chicken and pork broth, minced pork, garlic,
shrimp',15.29, 'slack-season-noodles.jpg', 'American', 'Breakfast', 'Like many dishes in Taiwan, this one combines meat and seafood. The broth is often enriched with a sea flavor by simmering the head and shells of the shrimp in a basic pork stock. The noodles are then topped with a simmered pork sauce often served with rice or noodles - a meat sauce recipe can be found here - plus the only cooked shrimp that is solemnly placed on top.', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (17, 3, 3, 'Pork Meat Soup Dumplings', 'Rice flour, char siu, minced pork',16.39, 'porkmeatsoupdumplings.jpg', 'China', 'Breakfast', 'The Chinese soup dumplings are probably the most perfect food ever made. This dreamy snack is probably the most famous one from Jiangnan region, China. It is often associated with Shanghai city (the largest city in the region by population and also the largest city in China!), Which is why soup dumplings are often referred to as “Banh Bao”. Shanghai soup bag ”.', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (18, 3, 3, 'Shanghai Sauteed Flat Noodle', 'Rice flour, pork, green onion, vegetables, chili, sugar, salt',12.89, 'shanghaisauteedflatnoodle.jpg', 'Viet Nam', 'Dinner', 'Plump, handmade noodles are the preference and have been for centuries.  Watching Chinese noodle-makers at work in food stalls along the streets of Shanghai, pulling dough and chopping with cleavers at lightening speed is truly awe-inspiring.  And whatever variations of noodles are served, the most popular remain ones based on rich brown sauces such as the one featured in this authentic recipe.  Not encumbered with a lot other ingredients, the central feature of this dish is, of course, the noodles. ', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (19, 4, 4, 'Anitas Cantina', 'Beef, cheese, potato, onion, fries',10.59, 'AnitasCantina.jpg', 'Mexico', 'Breakfast', 'We bring the flavors of South Texas and Mexico to you. Our Anitas Cantina is made from traditional home recipes. Everything on our menu is made with love at home - including our critically acclaimed corn and flour sandwiches. All of them are handmade, because nothing can beat homemade!', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (20, 4, 4, 'Salt n Lime', 'Beef, cheese, potato, onion, fries',13.89, 'SaltnLime.jpg', 'Mexico', 'Lunch', 'At Salt n Lime we offer clean n safely prepared meals of excellent quality and invite you to try our fresh Mexican n American foods. The key to our success is simple: providing quality consistent food that tastes great every single time', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (21, 4, 4, 'Street Tacos', '2 tablespoons reduced sodium soy sauce
2 tablespoons freshly squeezed lime juice
2 tablespoons canola oil, divided
3 cloves garlic, minced
2 teaspoons chili powder',18.39, 'StreetTacos.jpg', 'Mexico', 'Snacks', 'What are street tacos? Mexican street tacos are smaller tacos, typically served on corn tortillas. They are small in size, making it easier for a “street traveler” to enjoy a quick meal. The filling is served on two small corn tortillas so that they dont rip or tear when piled high with toppings', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (22, 4, 4, 'LimeVeganTacos', '2 tablespoons avocado oil (or coconut oil)
1/2 red onion, diced small
1/2 jalapeño, diced small (optional; or more to taste!)
1 large zucchini, chopped
1 green bell pepper, chopped (or any color)',15.29, 'LimeVeganTacos.jpg', 'Mexico', 'Dinner', 'The tacos are filled with pinto beans and brown rice simmered in veggie broth and seasonings. The tacos are then slathered in a tangy cilantro-lime sauce and topped with diced onion and fresh cilantro', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (23, 4, 4, 'Chicken Tacos', '1 large red onion, diced (reserve half)
500g chicken mince
30g Old El Paso™ Taco Spice Mix
1/2 cup water
1/2 cup Old El Paso™ Mild Taco Sauce',16.39, 'ChickenTacos.jpg', 'Mexico', 'Dinner', 'n a small bowl, combine chili powder, cumin, paprika, oregano, garlic powder, 1 teaspoon salt and 1/2 teaspoon pepper. Season chicken with chili powder mixture. Heat canola oil in a large skillet over medium high heat. Serve chicken in tortillas, topped with pico de gallo, avocado, cilantro and lime', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (24, 4, 4, 'Naco Taco', 'Beef, cheese, potato, onion, fries',12.89, 'NacoTaco.jpg', 'Mexico', 'Dinner', 'Food was tasty. Service was awesome, drinks were delicious. The restaurant has dim lighting, the sides are enough to share. I Couldnt have picked a better place to celebrate my birthday. Monday nights seem very low-key', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (25, 5, 5, 'Original Chicken Sandwich', 'Beef, cheese, potato, onion, fries',10.59, 'OriginalChicken.jpg', 'American', 'Lunch', 'Our original Chicken Sandwich is made from white chicken, light flour and topped with a simple combination of chopped lettuce and cream mayonnaise on a nut bread. We know that you will love this cake.', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (26, 5, 5, 'Croissanwich Meal for Two', 'Beef, cheese, potato, onion, fries',13.89, 'Croissa.jpg', 'American', 'Dinner', 'Our King Croissanwich with Double Sausage is now made with 100% butter for a soft, flaky croissant piled high with fluffy eggs, two helpings of melted American cheese, and a hearty serving of savory sizzling sausage.', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (27, 5, 5, 'Smoked Bacon Brisket Burger', 'Certified Angus Beef, smoked aged cheddar cheese, brisket, applewood smoked bacon, pickles, bbq sauce, toasted brioche bun',18.39, 'Smashburger.jpg', 'American', 'Lunch', 'Brisket Bacon Burger is made with certified Angus beef and covered with smoked brisket for 10 hours, then layered with Applewood bacon, smoked cheese, pickles and BBQ sauce on a brioche sandwich. Delivering an explosive taste in every delicious bite, Smashburger latest innovation will satisfy any meat-eaters cravings for meat.', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (28, 5, 5, 'Mighty McMuffin Meal ', 'Beef, cheese, potato, onion, fries',15.29, 'Product_thumb_McMuffin-Mighty.jpg', 'American', 'Lunch', 'Mighty McMuffin is a messy Sausage & Eggs McMuffin throws two pieces of bacon and ketchup into the mix. The result is a dangerously addictive breakfast even by Macca standards: a single serving of 1950kJ energy, 11.4g of saturated fat, 31.5g of carbohydrates, 5.7g of sugar and 1220mg. sodium. Thats a pretty big total for something you can polish in four or five bites.', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (29, 5, 5, 'BBQ Brekky Stack', 'Beef, cheese, potato, onion, fries',16.39, 'BBQ_Brekky_Stack.jpg', 'American', 'Dinner', 'Heres a great reason to spring out of bed. The awesome combination of a freshly cracked egg, flame-grilled sausage patty, premium eye bacon, cheese and BBQ sauce on a warm toasted tortilla wrap.', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (30, 5, 5, 'Veg Burger', 'Beef, cheese, potato, onion, fries',12.89, 'VegBurger.jpg', 'American', 'Lunch', 'These veggie burgers are packed with vegetables! See how to make homemade veggie burgers that are hearty, flavorful and full of vegetables. These delicious vegetable-packed burgers are high in fiber (5 grams) and come in at just under 200 calories for one patty. Vegan substitutes are included in the recipe.', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (31, 6, 6, 'Spaghetti with Ramps', 'Ramps, Chilies and Parmesan',10.59, 'Spaghetti.jpg', 'Chinese', 'Breakfast', 'Seafood is a treasured delicacy in Italy, which is no surprise when you think about the expansive coastline stretching from the northern regions of Veneto and Liguria all the way to the southern island of Sicily. From the shores of the Adriatic sea and the glistening marinas that line the Amalfi coast to the bustling ports of the Italian riviera, seafood is freshly prepared everyday in humble, family-run eateries to be enjoyed by locals and holiday-makers alike. In this dish, we pay homage to the time-honoured culinary traditions of Italy’s seaside towns.', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (32, 6, 6, 'Bucatini', 'Pancetta, Tomato, Chilies and Pecorino',13.89, 'delish-bucatinipasta.jpg', 'Chinese', 'Snacks', 'The beautiful, rolling hills of Tuscany are home to countless vineyards and the region is fondly nicknamed ‘Chiantishire’ after the bold red wine that it produces in abundance. However, it is not only for its wine that this region is so well-loved.', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (33, 6, 6, 'Garganelli', 'Mushroom Ragu and Ricotta Salata',18.39, 'creamy-cacio-e-pepe-recipe-2150w.jpg', 'Chinese', 'Breakfast', 'Now very much a favourite amongst the Pasta Evangelists community – and something of a signature dish – this hedonistic Roman classic is thought to have its name derived from when charcoal burners were used to cook the dish over campfires. In true Pasta Evangelists style, we’ve added our own twist to this classic, comforting dish, presenting a gloriously creamy carbonara with tangles of fresh bucatini – in our opinion bigger and better than spaghetti – which sop up this luxuriant sauce.', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (34, 6, 6, 'Cacio Pepe', 'Black Pepper, Pecorino and Butter',15.29, 'CacioPepe.jpg', 'Chinese', 'Lunch', 'This sauce, although not strictly traditional, combines the classic ingredients of several regions of Italy: Calabria and Campania in the south and Lombardia in the north. Calabrian ‘nduja sausage, citrus celebrated in Campania, and mascarpone originating in Lombardia come together in this irresistible dish. The spicy and soft ‘nduja sausage forms the perfect base for this sauce', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (35, 6, 6, 'Tagliatelle', 'Bolognese Bianco (Chicken, Veal, Pork) and Parmesan',16.39, 'tagliatelle-arrabbiata.jpg', 'Chinese', 'Breakfast', 'In this weeks Italo-Americano special, weve created the ultimate macaroni cheese, transforming a somewhat scorned American staple into something utterly irresistible. To do so, weve called upon a selection of beautiful cheeses from Italy, as well as a sumptuous scattering of gorgeous truffles sourced in Umbria', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (36, 6, 6, 'Mint Pangrattato', 'Red Pepper, San Marzano Tomatoes, Extra Virgin Olive Oil, Salt, Basil',12.89, 'pangratto.jpg', 'American', 'Dinner', 'In Sardinia, you can ask any passerby - albeit in Sardu, the local language - what the secret to the island’s cuisine is and, should you understand the vernacular, they will tell you that the perfect Sardinian dish relies not on elaborate preparation but the use of as few ingredients as possible. Each, however, must be exquisite. ', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (37, 7, 7, 'Margherita Pizza', 'Tomato sauce, mozzarella cheese and
basil.',10.59, 'margherita-pizza.jpg', 'American', 'Lunch', 'Is a classic American pizza, with traditional American flavor and character', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (38, 7, 7, 'Pepperoni Pizza', 'Pepperoni, tomato sauce, mozzarella, and
provolone.',13.89, 'repperoni-pizza.jpg', 'ThaiLan', 'Dinner', 'using a special cheese called Pepperoni, n with a special taste gives the eater a new and attractive feeling.', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (39, 7, 7, 'Italian Sausage Pizza', 'Tomato sauce, spicy sausage, smoked
mozzarella, potato, mama Lils peppers,…',18.39, 'italian-sausage-pizza.jpg', 'Korean', 'Lunch', 'An Italian pizza that uses special spicy sausage with mozzarella bacon to create a distinctive spicy flavor and is only suitable for adults and people to eat spicy.', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (40, 7, 7, 'Cheese Pizza', 'Tomato sauce, mozzarella and provolone.',15.29, 'cheese-pizza.jpg', 'Japan', 'Breakfast', 'Cheese pizza uses cheese as the main flavor to make a difference to the cake and create a new impression on the eaters.', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (41, 7, 7, 'Mushroom Pizza', 'Garlic, fontina, scallion, ricotta, and parmigiano.',16.39, 'mushroom-pizza.jpg', 'Viet Nam', 'Lunch', 'This pizza uses parmigiano mushrooms to create a highlight for the cake, parmigiano mushrooms combined with the leaves to create a special aroma that attracts people to eat.', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (42, 7, 7, 'Fennel Diavolo Pizza', 'Garlic, spicy fennel, calabrese salami, red
onion, mozzarella, fennel pollen,…',12.89, 'fennel-diavolo-pizza.jpg', 'American', 'Snacks', 'Is a pizza that combines many different ingredients and spices to create harmony and give people a delicious pizza.', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (43, 8, 8, 'Salmon Avocado Roll', 'Salmon and avocado',10.59, 'salmon-avocado-roll.jpg', 'Viet Nam', 'Snacks', 'The combination of salmon and avocado creates a rich and creamy sushi dish', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (44, 8, 8, 'Spicy Tuna Roll', 'tuna and cucumber',13.89, 'spicy-tuna-roll.jpg', 'Japan', 'Dinner', 'Soft tuna and crispy cucumber combine to create a harmonious combination for delicious sushi', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (45, 8, 8, 'Baked Salmon Roll', 'salmon and cheese',18.39, 'baked-salmon-roll.jpg', 'American', 'Lunch', 'Grilled salmon with special sauce and cheese topped with a new flavor and california wrap create an eye-catching feeling for sushi.', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (46, 8, 8, 'California Rool', 'Rice and butter',15.29, 'california-roll.jpg', 'ThaiLan', 'Dinner', 'Rice and avocado create a novel combination for sushi. With familiar ingredients, but this novel combination will bring everyone delicious and attractive sushi dishes ', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (47, 8, 8, 'Salmon Sushi', 'Rice and salmon',16.39, 'salmon-sushi.jpg', 'Japan', 'Breakfast', 'Salmon sushi is no longer a strange dish to everyone, a familiar delicious sushi that everyone should try at least once in their life.', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (48, 8, 8, 'Shrimp Tempura Roll', 'Shrimp tempura, avocado and
cucumber roll and Topped with eel sauce.',12.89, 'shrim-tempura-roll.jpg', 'American', 'Snacks', 'Rice roll with shrimp, avocado, cucumber and eel sauce these 4 ingredients work together to create delicious and exotic sushi. 4 unrelated ingredients but when combined to create an unforgettable taste for first time eaters ', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (49, 9, 9, 'Little Bowl', 'Coconut milk, jelly, pearls',10.59, 'LittleBowl.jpg', 'VietNam', 'Snacks', 'Very small bowls, such as the tea bowl, are often called cups, while plates with especially deep wells are often called bowls. In many cultures bowls are the most common kind of vessel used for serving and eating food. Historically small bowls were also used for serving both tea and alcoholic drinks.', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (50, 9, 9, 'Cheap Corner', 'Rice, meat, vegetables',13.89, 'CheapCorner.jpg', 'VietNam', 'Snacks', 'Product Description. If you are looking for comfort, style and competitive prices youve found the right sofa for you', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (51, 9, 9, 'Local Desserts', 'Ice blended, jelly, yogurt',18.39, 'LocalDesserts.jpg', 'VietNam', 'Breakfast', 'There is widespread use of rice flour in East Asian desserts, which often include local ingredients', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (52, 9, 9, 'Vietnamese Ice Cream', 'Cream, sticky rice, dry coconut',15.29, 'VietnameseIcecream.jpg', 'VietNam', 'Dinner', 'Ice cream (derived from earlier iced cream or cream ice) is a sweetened frozen food typically eaten as a snack or dessert. It may be made from dairy milk or cream and is flavoured with a sweetener, either sugar or an alternative, and any spice, such as cocoa or vanilla', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (53, 9, 9, 'Dough Tampas', 'Wheat flour, milk, chocolate',16.39, 'DoughTampas.jpg', 'VietNam', 'Lunch', 'Description. Meet Dough: a quirky and whimsical bistro and bakery by Datz. This is the place for delicious morning pastries, eclectic lunch, an afterschool snack', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (54, 9, 9, 'Dessert Place', 'Ice cream, chocolate, milk',12.89, 'DessertPlace.jpg', 'VietNam', 'Breakfast', 'Ice cream and chocolate taste great together', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (55, 10, 1, 'Milk Tea', 'Tea, milk, sugar, pearls and fruit syrup',15.89, 'MilkTea.jpg', 'Korean', 'Snacks', 'The term ""milk tea"" refers to any tea drink with milk added. It can be as simple as a splash of milk in a hot cup of tea, or it can be a complex recipe including various ingredients, like the popular bubble tea. ... Milk tea is enjoyed throughout the world as both a hot and cold beverage.', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (56, 10, 1, 'Cappuccino', 'Coffee, milk, cream',12.68, 'capuchino.jpg', 'Italy', 'Dinner', 'As cappuccino is defined today, in addition to a single shot of espresso, the most important factors in preparing a cappuccino are the texture and temperature of the milk. When a barista steams the milk for a cappuccino, microfoam is created by introducing very tiny bubbles of air into the milk, giving the milk a velvety texture. The traditional cappuccino consists of a single espresso, on which the barista pours the hot foamed milk, resulting in a 2 cm (3⁄4 in) thick milk foam on top. Variations could be made adding another shot of espresso resulting in a double cappuccino. Attaining the correct ratio of foam requires close attention while steaming the milk, thus making the cappuccino one of the most difficult espresso-based beverages to make properly. A skilled barista may obtain artistic shapes (latte art while pouring the milk on the top of the espresso coffee).', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (57, 10, 1, 'Fruit Juice', 'Fruit, sugar, ice cold',18.39, 'FruitJuice.jpg', 'Korean', 'Breakfast', 'Fruit juice is 100% pure juice made from the flesh of fresh fruit or from whole fruit, depending on the type used. It is not permitted to add sugars, sweeteners, preservatives, flavourings or colourings to fruit juice. Fruit juices are usually described as: From concentrate.', TRUE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (58, 10, 1, 'Matcha Mojito', 'White rum, sugar, lemon juice, soda water and green tea powder',15.29, 'MatchaMojito.jpg', 'Korean', 'Dinner', 'The combination of the sweetness of green tea and the herbal mint flavor is intended to complement rum, making mojito a popular summer drink.', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (59, 10, 1, 'Cocktail Cafe', 'Base wines, colorants, fragrances, coffee and decorations',16.39, 'CocktailCafe.jpg', 'Korean', 'Snacks', 'A cocktail is an alcoholic mixed drink, which is either a combination of spirits, or one or more spirits mixed with other ingredients such as fruit juice, flavored syrup, or cream.', FALSE);
INSERT INTO product (Id, Product_Category_Id, Restaurant_Id, Name, Ingredients, Price, Image, Country, Tag, Description, Featured)
VALUE (60, 10, 1, 'US-Beverages', 'Water, fruit, ice, sugar',10.59, 'US-Beveragee.jpg', 'USA', 'Lunch', 'Cool non-alcoholic drinks and fruity flavors', TRUE);


INSERT INTO restaurant (id, name, image, address, description)
VALUE (1, 'Essence Restaurant', 'EssenceRestaurant.PNG', '154 East 79th Street, Manhattan New York, USA', 'With an extensive drink menu including fresh fruit shakes, coffee, cocktails and wines, the restaurant guarantees a nutritious meal with delicious food, great service in the right space and brandy , all with the most affordable prices in town.');
INSERT INTO restaurant (id, name, image, address, description)
VALUE (2, 'Chestnut Restaurant & Sky Bar', 'ChestnutRestaurant.PNG', '35-4, Insadong-gil, Jongno-gu, Seoul, South Korea', 'Vegan Chestnut & Sky Bar restaurant serves a variety of meals including salads, skin rolls, sandwiches, vegetarian burgers, lentils bowls and pasta dinner. Serves craft beers, tap water kombucha, cold-pressed smoothies and juices. The kitchen stopped at 9pm.');
INSERT INTO restaurant (id, name, image, address, description)
VALUE (3, 'Poke Hanoi', 'poke_hanoi.PNG', '11B Hang Khay | Alley | Level 3 Hoan Kiem, Hanoi Vietnam', 'Poke Hanoi serves Hawaiian Poke. Poke Is a Hawaiian dish made of raw cube of fish marinated, in sauces. We serve our poke with rice, salads and a variety of toppings which you can choose yourself. Perfect place to eat healthy, we also serve smoothie bowls.');
INSERT INTO restaurant (id, name, image, address, description)
VALUE (4, 'Chops Old Quarter', 'chopsolder.PNG', '12 Hang Bac Hanoi Old Quarter, Hoan Kiem, Hanoi', 'Serving food from 8am until late Chops has got you covered. With our daily brunch menu serving delights from French Toast to a good old English Fry Up. And our burger menu that runs all day serving up the best burgers Hanoi has to offer, or if your feeling a bit healthier they try one of our amazing salads');
INSERT INTO restaurant (id, name, image, address, description)
VALUE (5, 'Burgers Berlin', 'BurgersBerlin.jpg', '112 Sonntag, Berlin, Germany', 'Burgers Berlin is currently a major fast food restaurant. Every day, more than 1000 diners come to Burgers Berlin restaurant to enjoy high quality food, excellent taste and affordable prices. The predecessor was Insta-Burger King, founded by Matthew Burns and Keith J.');
INSERT INTO restaurant (id, name, image, address, description)
VALUE (6, 'Hoang Cuisine', 'HoangCuisine.PNG', '2nd Floor, 20 Bat Dan Street Hang Bo Ward, Hanoi, Vietnam', 'Based on our experiences working in tourism industry, we have many chances to know more about not only culture but also customs from people all over the world coming to Vietnam. We would like to introduce our pride - Vietnamese cuisine to all our friends from different countries.');
INSERT INTO restaurant (id, name, image, address, description)
VALUE (7, 'Green Cuisine', 'tungkitchen.jpg', '15 Ta Hien, Hang Buom, Hoan Kiem, Hanoi', 'Even if diners are willing to pay a minimum of $ 325 per person, it can be difficult to book a table at this food temple. However, it is hard to resist the appeal of Thomas Kellers famous ""Chicken egg salad"", accompanied by 8 perfect dishes without any repeating ingredients in each dish.');
INSERT INTO restaurant (id, name, image, address, description)
VALUE (8, 'The Handpulled Noodle', 'TheHandpulledNoodle.PNG', '196 Spring St Soho, New York City, USA', 'The Sichuan dishes here look very nice with delicious taste. Diners coming here not only can enjoy the food but also watch the artists performing the painting on the zither in the evening. Sitting on a luxury restaurant, diners eat and drink while watching the skyline.');
INSERT INTO restaurant (id, name, image, address, description)
VALUE (9, 'Xian Famous Foods', 'xianfood.png', '778 Wall Street, New York, NY, USA', 'In fact, Xian Famous Foods has many similarities with Sichuan, but the flavor is different because of its sour taste, many salt grains and the dish often has a small bacon added. When visiting a famous high-class restaurant, visitors should enjoy the restaurant famous dishes such as fish head cooked with crushed eggplant, sauteed pork.');
