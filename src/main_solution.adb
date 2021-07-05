with Ada.Text_IO; use Ada.Text_IO;
with Ring_Buffer;

procedure Main is

   procedure printCharacter (c : Character) is
   begin
      Put(c'Image);
   end printCharacter;

   type RingIndex is mod 2**4;

   package RB is new Ring_Buffer (Character, RingIndex, printCharacter);

   is_peek_blocking : Boolean := True;
   c                : Character := '_';
   charRing         : RB.RingBuffer;
   
   
   
   
   task Writer_One;
   task Writer_Two;
   
   task body Writer_One is
   begin
      for c in Character range 'a' .. 'z' loop
         Put_Line("Task Writer One: Pushing char c "& c'Image);
         charRing.push(data => c);
         delay 2.0;
      end loop;
   end Writer_One;
   
   task body Writer_Two is
   begin
      for c in Character range 'A' .. 'Z' loop
         Put_Line("Task Writer Two: Pushing char c "& c'Image);
         charRing.push(c);
         delay 3.0;
      end loop;
   end Writer_Two;
   
begin
   Put_Line("in main");
   while True loop
      --charRing.print;
      if is_peek_blocking then
         charRing.popBlocking(c);
      else
         c := '_';
         while c = '_' loop
            charRing.popNonBlocking('_', c);
            delay 3.0;
         end loop;
      end if;
      is_peek_blocking := not is_peek_blocking;
      Put_Line(c'Image);
   end loop;
end Main;
