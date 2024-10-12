package Bag_Type is
   
   --Name: Khayrullo Isomiddinov
   --Neptun: BET9FI
   
   type Bag is private;
   type Index is new Integer range 1..100;
   type Elem is new Integer;
     
   function Size(B: Bag) return Integer;
   
   procedure Insert_One(B : in out Bag);
   procedure Insert_Multiple(B : in out Bag);
   function Extract_One(B : in out Bag) return Bag;
   function Extract_Multiple(B : in out Bag) return Bag;
   function Remove_Elem(E : in Elem; B : in out Bag) return Bag;
   procedure Bag_Status(B : in out Bag);
   
   procedure Print_Bag(B : Bag); 
   procedure Show_Menu;
   
   
 private
   type Arr is array(Index range<>) of Elem;
   
   type Bag is record 
      Data : Arr(Index) := (others => 0); --for storing data
      Size : Natural := 0; -- starts off empty
   end record;
   
end Bag_Type;
