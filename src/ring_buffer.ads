-- @summary
-- Generic ring buffer package specification.
--
-- @author Julian Hartmer
-- @description
-- This package is a generic ring buffer. You can set the element type
-- when including this package.

with Ada.Containers.Vectors;

generic
   type Element is private;                 -- one has to specify these
   type Index is mod <>;

   -- procedure to print one ring buffer element
   -- @param E ring buffer element
   with procedure printElement (E : Element); -- when using this package
package Ring_Buffer is

   -- Size provided by Index (parameter of generic)
   type Memory is array (Index) of Element;

   package Element_Vector is new Ada.Containers.Vectors (Index_Type => Natural,
      Element_Type => Element);

   protected type RingBuffer is
      
      -- TODO: add functionality push
      -- push data into ring buffer
      -- Note: when full, data may override existing elements in RB

      -- TODO: add functionality get
      -- get element from ring buffer by index.
      -- Note: Behavior undefined when idx ahead of head and tail

      -- empties the RB
      -- sets head and tail to default values
      procedure reset;

      -- removes last element of RB. If RB empty, this does nothing.
      procedure removeLast;

      -- TODO: add functionality peekBlocking
      -- Get RB element at tail. Blocks and waits until is RB not empty.

      -- TODO: add functionality popBlocking
      -- Get and remove RB element at tail.
      -- Blocks and waits until is RB not empty.
      entry popBlocking (elem : out Element);

      -- TODO: add functionality peekNonBlocking
      -- Get RB element at tail. Has one paramter "value_on_empty".
      -- If RB has elements, return element at tail, else return
      -- value_on_empty.
      
      -- TODO: add functionality popNonBlocking
      -- Get RB element at tail if not empty, else returns value_on_empty.
      -- Removes returned value from RB.

      -- get index of RB head element
      -- @return index of RB head element
      function getHead return Index;

      -- get index of RB tail element
      -- @return index of RB tail element
      function getTail return Index;

      -- Checks if RB is empty
      -- @return true: empty, false: not empty
      function isEmpty return Boolean;

      -- Checks if RB is full
      -- @return true: full, false: not full
      function isFull return Boolean;

      -- Returns vector containing all valid elements in RB starting from tail
      -- to (head - 1).
      -- @return vector of RB elements
      function getElements return Element_Vector.Vector;

      -- Print all Elements in Ring Buffer.
      procedure print;

   private
      head   : Index   := 0;
      tail   : Index   := 0;
      buffer : Memory;
      full   : Boolean := False;
   end RingBuffer;

   --function createRingBuffer return RingBuffer;
end Ring_Buffer;
