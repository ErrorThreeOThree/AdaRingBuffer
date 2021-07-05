with Ada.Text_IO; use Ada.Text_IO;
with Ring_Buffer;

procedure Main is

   procedure printCharacter (c : Character) is
   begin
      Put(c'Image);
   end printCharacter;

   type RingIndex is mod 2**4;

   package RB is new Ring_Buffer (Character, RingIndex, printCharacter);

   is_pop_blocking : Boolean := True;
   c               : Character := '_';
   charRing        : RB.RingBuffer;

   task Writer_One;
   task Writer_Two;

   task body Writer_One is
   begin
      for c in Character range 'a' .. 'z' loop
         Put_Line("Task Writer One: Pushing char c "& c'Image);
         -- TODO push character c in charRing
         delay 2.0;
      end loop;
   end Writer_One;

   task body Writer_Two is
   begin
      for c in Character range 'A' .. 'Z' loop
         Put_Line("Task Writer Two: Pushing char c "& c'Image);
         -- TODO push character c in charRing
         delay 3.0;
      end loop;
   end Writer_Two;

begin
   Put_Line("in main");
   while True loop
      -- uncomment this line to print whole ring buffer (for debugging)
      -- charRing.print;
      if is_pop_blocking then
         -- TODO call charRing.popBlocking to get character c
         null;
      else
         c := '_';
         while c = '_' loop
            -- TODO call charRing.popNonBlocking to get character c
            delay 3.0;
         end loop;
      end if;
      is_pop_blocking := not is_pop_blocking;
      Put_Line(c'Image);
   end loop;
end Main;
