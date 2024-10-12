with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Bag_Type is

   function Size(B : Bag) return Integer is
   begin
      return B.Size;
   end Size;
   
   procedure Insert_One(B : in out Bag) is
      E : Integer;
   begin
      Put("Enter the element: ");
      Get(E);
      for I in Size(B) + 1 .. Natural(B.Data'Last) loop
         if B.Data(Index(I)) = 0 then 
            B.Data(Index(I)) := Elem(E);
            exit;
         end if;
      end loop;
      B.Size := B.Size + 1; 
   end Insert_One;
   
   procedure Insert_Multiple(B : in out Bag) is
      Limit : Index;
      E : Integer;
      beginning : Integer := Size(B) + 1;
   begin
      Put("How many elements to insert? - ");
      Get(Integer(Limit));
      
      for I in beginning .. (Size(B) + Integer(Limit)) loop
         Get(E);
         B.Data(Index(I)) := Elem(E);
         B.Size := B.Size + 1;
      end loop;
       
   end Insert_Multiple;
   
   function Extract_One(B : in out Bag) return Bag is
      E : Elem;
      New_Bag : Bag;
      New_Index : Index;
      Ind : Index := 1;
   begin
      Print_Bag(B);
      New_Line;
      New_Line;
      Put("Choose which element to extract: ");
      Get(Integer(E));
      for I in 1 .. Integer(Size(B)) loop
         if E = B.Data(Index(I)) then
            New_Index := Index(I);
         end if;
      end loop;
      
      --now we have the index where the element is 
      for I in 1 .. Integer(Size(B)) loop
         if New_Index /= Index(I) then
            New_Bag.Data(Ind) := B.Data(Index(I));
            Ind := Ind + 1;
            New_Bag.Size := New_Bag.Size + 1;
         end if;
      end loop;
      
      New_Line;
      Put_Line("Element extracted: " & Elem'Image(B.Data(New_Index)));
      New_Line;
      
      return New_Bag;
      
   end Extract_One;
   
   
   function Remove_Elem(E : in Elem; B : in out Bag) return Bag is
      New_Bag : Bag;
      Ind : Index := 1;
   begin
      for I in B.Data'Range loop
         if B.Data(I) /= E then 
            New_Bag.Data(Ind) := B.Data(I);
            Ind := Ind + 1;
            New_Bag.Size := New_Bag.Size + 1;
         end if;
      end loop;
      return New_Bag;
   end Remove_Elem;
   
   function Extract_Multiple(B : in out Bag) return Bag is
      Limit : Index;
      E : Elem;
      New_Bag : Bag;
   begin
      New_Line;
      Put("How many? - ");
      Get(Integer(Limit));
      for I in 1..Limit loop
         Get(Integer(E));
         New_Bag := Remove_Elem(E, B);
         New_Bag.Size := New_Bag.Size - 1;
         B := New_Bag;
      end loop;
      return New_Bag;
   end Extract_Multiple;
   
   
   procedure Show_Menu is
   begin
      Put_Line("0 - Exit");
      Put_Line("1 - Insert One Element");
      Put_Line("2 - Insert Multiple Elements");
      Put_Line("3 - Extract One Element");
      Put_Line("4 - Extract Multiple Elements");
      Put_Line("5 - Print Bag");
      Put_Line("6 - Check the bag status (empty or full)");
      Put("Choose - "); 
   end Show_Menu;
   
   
   procedure Bag_Status(B : in out Bag) is
   begin
      if Size(B) = 0 then 
         New_Line;
         Put_Line("The bag is empty");
         New_Line;
      elsif Size(B) = B.Data'Length then
         New_Line;
         Put_Line("The bag is full!");
         New_Line;
      else 
         New_Line;
         Put_Line("The bag is " & Integer'Image(Size(B)) & "% full");
         New_Line;
      end if;
      
   end Bag_Status;
   
   
   
   procedure Print_Bag(B : Bag) is
   
   begin
      if Size(B) = 0 then 
         Put("The bag is empty");
      end if;
      New_Line;
      Put_Line("The contents of the bag: ");
      Put("(");
      for I in 1..Size(B) loop
         if I = Size(B) then 
            Put(Elem'Image(B.Data(Index(I))) & " ");
         else
            Put(Elem'Image(B.Data(Index(I))) & ", ");
         end if;
      end loop;
      Put(")");
      New_Line;
      New_Line;
      Put("Size of the bag: " & Natural'Image(Size(B)));
      
   end Print_Bag;
end Bag_Type;
