--  My name is Shubodaya Heggur Narendra Kumar (2340644)
--  Group partner: Varun Shiva Prasad (2340648)
pragma SPARK_Mode;
with dam_control; use dam_control;
with AS_IO_Wrapper;  use AS_IO_Wrapper;

procedure main is
   Gate1_Already_Open : Boolean;
   Gate2_Already_Open : Boolean;
   Gate3_Already_Open  :Boolean;
   Number: Integer;
   Rate : Integer;
   User_Response : String(1 .. 10);
   Last : Integer;
begin
   Init;
   loop
      pragma Loop_Invariant (Is_Safe(Status_System));

      Water_Level;
      Wind_Level;
      Pressure_Level;
      Sismo_Level;
      Rain_Level;
      Snow_Level;
      Gate_Monitor_System;
      Print_Status;

      Gate1_Already_Open := False;
      Gate2_Already_Open := False;
      Gate3_Already_Open := False;

      while Status_System.Open_Dam_Gate = Activated loop
         AS_Put("Please confirm! To operate the Dam gates manually? (y/n): ");
         AS_Get_Line(User_Response, Last);
         exit when User_Response(1) = 'n'and Last >0;

         AS_Put("Enter the gate number to open (1, 2, or 3): ");
         loop
            AS_Get(Number, "Please type in a integer");
            exit when (Number >=1) and (Number <= Maximum_Number_of_Gates);
            AS_Put("Please type in a value between 1 and 3");
            AS_Put_Line("");
         end loop;
         Status_System.Number_of_Gates := Number_of_Gates_Range(Number);

         AS_Put("Enter the rate to open the gate (1, 2, 3, 4 or 5): ");
         loop
            AS_Get(Rate, "Please type in a integer");
            exit when (Rate >=1) and (Rate <= Maximum_Rate_of_Gate);
            AS_Put("Please type in a value between 1 and 5");
            AS_Put_Line("");
         end loop;
         Status_System.Rate_of_Gate := Rate_of_Gate_range(Rate);

         if Number_of_Gates_Range(Number) = 1 then

            if Gate1_Already_Open then
               AS_Put(" Gate 1 is already open. Do you want to change the rate? (y/n): ");
               AS_Get_Line(User_Response, Last);
               if User_Response(1) = 'y' and Last >0 then
                  AS_Put_Line(" Changed rate of gate 1 to " & Integer'Image(Integer(Status_System.Rate_of_Gate)) & ".");
               elsif User_Response(1) = 'n' and Last >0 then
                  AS_Put("Do you want to close this gate? (y/n): ");
                  AS_Get_Line(User_Response, Last);
                  if User_Response(1) = 'y' and Last >0 then
                     AS_Put_Line("Closing the gate");
                     Gate1_Already_Open := False;
                  else
                     AS_Put_line(" Keeping the current rate.");
                  end if;
               else As_Put(" ");
               end if;
            else
               Gate1_Already_Open := True;
               AS_Put_Line("Gate 1 opened at rate "& Integer'Image(Integer(Status_System.Rate_of_Gate)) & ".");
            end if;
         elsif Number_of_Gates_Range(Number) = 2 then

            if Gate2_Already_Open then
               AS_Put(" Gate 2 is already open. Do you want to change the rate? (y/n): ");
               AS_Get_Line(User_Response, Last);
               if User_Response(1) = 'y' and Last >0 then
                  AS_Put_Line(" Changed rate of gate 2 to " & Integer'Image(Integer(Status_System.Rate_of_Gate)) & ".");
               elsif User_Response(1) = 'n' and Last >0 then
                  AS_Put("Do you want to close this gate? (y/n)");
                  AS_Get_Line(User_Response, Last);
                  if User_Response(1) = 'y'  and Last >0 then
                     AS_Put_Line("Closing the gate");
                     Gate2_Already_Open := False;
                  else
                     AS_Put_line(" Keeping the current rate.");
                  end if;
               else As_Put(" ");
               end if;
            else
               Gate2_Already_Open := True;
               AS_Put_Line("Gate 2 opened at rate "& Integer'Image(Integer(Status_System.Rate_of_Gate)) & ".");
            end if;
         elsif Number_of_Gates_Range(Number) = 3 then

            if Gate3_Already_Open then
               AS_Put(" Gate 3 is already open. Do you want to change the rate? (y/n): ");
               AS_Get_Line(User_Response, Last);
               if User_Response(1) = 'y' and Last >0 then
                  AS_Put_Line(" Changed rate of gate 3 to " & Integer'Image(Integer(Status_System.Rate_of_Gate)) & ".");
               elsif User_Response(1) = 'n' and Last >0 then
                  AS_Put("Do you want to close this gate? (y/n)");
                  AS_Get_Line(User_Response, Last);
                  if User_Response(1) = 'y' and Last >0 then
                     AS_Put_Line("Closing the gate");
                     Gate3_Already_Open := False;
                  else
                     AS_Put_line(" Keeping the current rate.");
                  end if;
               else As_Put(" ");
               end if;
            else
               Gate3_Already_Open := True;
               AS_Put_Line("Gate 3 opened at rate "& Integer'Image(Integer(Status_System.Rate_of_Gate)) & ".");
            end if;
         else As_Put(" ");
         end if;

         AS_Put("Do you want to open another gate? (y/n): ");
         AS_Get_Line(User_Response, Last);
         exit when User_Response(1 .. 1) = "n" and Last >0;
      end loop;




   end loop;
end main;
