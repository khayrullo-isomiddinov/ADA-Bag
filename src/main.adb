with Ada.Text_IO; use Ada.Text_IO;
with Bag_Type; use Bag_Type;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is
   My_Bag : Bag;
   Option : Integer;
begin

   Show_Menu;

   while true loop
      Get(Option);
      case Option is
      when 1 =>
         New_Line;
         Insert_One(My_Bag);
         New_Line;
         Show_Menu;
      when 2 =>
         New_Line;
         Insert_Multiple(My_Bag);
         New_Line;
         Show_Menu;
      when 3 =>
         New_Line;
         My_Bag := Extract_One(My_Bag);
         Show_Menu;
      when 4 =>
         New_Line;
         My_Bag := Extract_Multiple(My_Bag);
         Show_Menu;
      when 0 =>
         exit;
      when 5 =>
         New_Line;
         Print_Bag(My_Bag);
         New_Line;
         Show_Menu;
      when 6 =>
         Bag_Status(My_Bag);
         Show_Menu;
      when others =>
         Put("Wrong number!");
      end case;
   end loop;


end Main;
