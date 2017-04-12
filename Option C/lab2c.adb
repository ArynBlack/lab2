with Ada.Text_IO; use Ada.Text_IO;
with arrayTypes; use arrayTypes;

procedure lab2c is
   package Int_IO is new Ada.Text_IO.Integer_IO(Integer); use Int_IO;
   lower, upper, init, max : Integer;

   procedure Push(space : in out arrayTypes.stringArray; base : in out intArray; top : in out intArray; stack : in Integer; text : in charArray) is
   begin
      top(stack) := top(stack) + 1;
      if top(stack) > base(stack + 1) then
         Put_Line("PUSH OVERFLOW");
         reallocate.reallocate();
      else
         space(top(stack)) := text;
      end if;

   end Insert;

   procedure Pop(space : in out arrayTypes.stringArray; base : in out intArray; top : in out intArray; stack : in Integer; text : out charArray) is
   begin
      if top(stack) = base(stack) then
         Put_Line("POP OVERFLOW");
      else
         text := space(top(stack));
         top(stack) := top(stack) - 1;
      end if;
   end Pop;
begin
   Put("Enter a lower bound: "); Get(lower);
   Put("Enter an upper bound: "); Get(upper);
   Put("Enter an initial location: "); Get(init);
   Put("Enter the max: "); Get(max);

   declare
      space : arrayTypes.stringArray(lower..upper);
      top : arrayTypes.intArray(1..4);
      base : arrayTypes.intArray(1..4);
      text : String(1..13);
      temp : arrayTypes.charArray(1..10);
   begin
      for j in 1..4 loop
         base(j) := Integer(Float'Floor(((Float(j) - 1.0) / 4.0 * Float(max - init)) + Float(init))) + 1;
         top(j) := base(j);
      end loop;
      Put("Enter text: "); Get(text);
      while text /= "end       " loop
         for i in 4..12 loop
            temp(i) := text(i);
         end loop;
         if text(1) = 'I' then
            Push(space, base, top, Integer'Value(text(2)), temp);
         elsif text(1) = 'D' then
            Pop(space, base, top, Integer'Value(text(2)), temp);
            New_Line;
            for i in temp loop
               Put(temp(i));
            end loop;
            New_Line;
         end if;
         Put("Enter text: "); Get(text);
      end loop;
   end;
end lab2c;
