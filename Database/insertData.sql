-- a
/*
create 10 comic books in "Item"
create 10 movies in "Item"
create 20 store items into "StoreItems" according to comic books and movies
create 10 entries in "Customer", 2 of which are gold members
create 2 entries in "GoldCustomer" according to the 2 gold members
*/

-- comic books
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (1, 'Spider Man #1', '11-Nov-1999', 'Marvel', 'Spider Man Shoots Webs');
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (2, 'Iron Man #1', '21-Feb-2012', 'Marvel', 'Iron Man Is Rich');
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (3, 'Hulk #4', '25-Jun-2008', 'Marvel', 'Hulk Is Green');
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (4, 'Venom #12', '26-Oct-2022', 'Marvel', 'Venom Is Alien');
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (5, 'Age of Ultron #1', '06-Mar-2013', 'Marvel', 'No One Can Stop Ultron');
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (6, 'Superman #1', '7-Jun-1939', 'DC Universe', 'Superman Can Fly');
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (7, 'Batman #3', '06-Nov-1940', 'DC Universe', 'Batman Works At Night');
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (8, 'Flash Comics #1', '03-Jan-1940', 'DC Universe', 'Flash Runs Fast');
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (9, 'Wonder Woman #3', '03-Feb-1943', 'DC Universe', 'Wonder Woman Is Wonderful');
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (10, 'Green Lantern #10', '01-Dec-1943', 'DC Universe', 'Green Lantern has a Lantern');

-- Movies
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (11, 'Interstellar', '26-Oct-2014', 'Paramount Pictures', 'Find another planet and save humanity');
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (12, 'The Shawshank Redemption', '10-Sep-1994', 'Columbia Pictures', 'Break out of Prison');
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (13, 'Inception', '8-Jul-2010', 'Warner Bros', 'Are we in a dream or not?');
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (14, 'Weakness', '11-Sep-2010', 'Sony Pictures', 'Boy Becomes Football Player');
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (15, 'Top Gun', '12-May-1986', 'Paramount Pictures', 'Tom Cruise in the sky');
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (16, 'Seven Pounds', '19-Dec-2008', 'Sony Pictures', 'Organ Donations, Redemption');
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (17, 'The Godfather', '14-Mar-1972', 'Paramount Pictures', 'Mafia and Family');
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (18, 'Dead Poets Society', '2-Jun-1989', 'Buena Vista Pictures', 'Realism or Romanticism?');
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (19, 'The Chorus', '11-Nov-2004', 'Vega Film', 'Bad Boys Become Good Singers');
insert into Item(ItemId, Title, PublishDate, StudioName, Description) values (20, 'I Am Legend', '9-Feb-2007', 'Warner Bros', 'Will Smith and Zombies');


-- StoreItems
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (101, 1, 10.99, 10, 'Comic Book');
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (102, 2, 8.99, 1, 'Comic Book');
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (103, 3, 12.99, 2, 'Comic Book');
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (104, 4, 6.99, 100, 'Comic Book');
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (105, 5, 20.99, 20, 'Comic Book');
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (106, 6, 7.99, 14, 'Comic Book');
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (107, 7, 11.99, 30, 'Comic Book');
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (108, 8, 10.99, 6, 'Comic Book');
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (109, 9, 10.99, 19, 'Comic Book');
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (110, 10, 17.99, 97, 'Comic Book');
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (111, 11, 10.99, 5, 'Movie');
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (112, 12, 6.99, 5, 'Movie');
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (113, 13, 3.99, 5, 'Movie');
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (114, 14, 8.99, 5, 'Movie');
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (115, 15, 7.99, 5, 'Movie');
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (116, 16, 10.99, 5, 'Movie');
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (117, 17, 11.99, 5, 'Movie');
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (118, 18, 12.99, 5, 'Movie');
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (119, 19, 20.99, 5, 'Movie');
insert into StoreItems(StoreItemsId, ItemId, Price, NumberOfCopies, ItemType) values (120, 20, 9.99, 5, 'Movie');

-- Customer 
insert into Customer(CustId, CustType, Name, Email, Address) values (1, 'Gold', 'Darcy', 'darcy.scu.edu', '380 Benton St');
insert into Customer(CustId, CustType, Name, Email, Address) values (2, 'Gold', 'Jimmy', 'jimmy.scu.edu', '2000 Montgomery Dr');
insert into Customer(CustId, CustType, Name, Email, Address) values (3, 'Regular', 'Bob', 'bob.scu.edu', '123 Brentwood St');
insert into Customer(CustId, CustType, Name, Email, Address) values (4, 'Regular', 'Rosy', 'rosy.scu.edu', '100 One Shields St');
insert into Customer(CustId, CustType, Name, Email, Address) values (5, 'Regular', 'Yulin', 'yulin.scu.edu', '6743 Broken Dreams Blvd');
insert into Customer(CustId, CustType, Name, Email, Address) values (6, 'Regular', 'Rick', 'rick.scu.edu', '880 Cowell Rd');
insert into Customer(CustId, CustType, Name, Email, Address) values (7, 'Regular', 'Morty', 'morty.scu.edu', '1126 Russel Blvd');
insert into Customer(CustId, CustType, Name, Email, Address) values (8, 'Regular', 'Jesse', 'jesse.scu.edu', '4399 Scout Blvd');
insert into Customer(CustId, CustType, Name, Email, Address) values (9, 'Regular', 'Walter', 'walter.scu.edu', '2090 El Camino Real');
insert into Customer(CustId, CustType, Name, Email, Address) values (10, 'Regular', 'Vince', 'vince.scu.edu', '3080 Nvida St');

-- GoldCustomer
insert into GoldCustomer(CustId, DateJoined, Coupons) values (1, '26-Oct-2022', '40OFF');
insert into GoldCustomer(CustId, DateJoined, Coupons) values (2, '26-Oct-2022', '40OFF');


-- tests 
insert into CustOrder(CustId, OrderId, DateOfOrder, ShippedDate, ShippingFee) values (3, 5, '26-Oct-2022', NULL, 10);

update Customer
set CustType = 'Gold'
where CustId = 3;