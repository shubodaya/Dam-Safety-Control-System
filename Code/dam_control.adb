--  My name is Shubodaya Heggur Narendra Kumar (2340644)
--  Group partner: Varun Shiva Prasad (2340648)
pragma SPARK_Mode;
with AS_IO_Wrapper;  use AS_IO_Wrapper;

package body dam_control is

   procedure Water_Level is
      Water : Integer;
   begin
      AS_Put("Enter current water level (meters): ");
      loop
         AS_Get(Water, "Please type in a integer");
         exit when (Water >=0) and (Water <= Maximum_Water_Level_Possible);
         AS_Put("Please type in a value between 0 and ");
         AS_Put(Maximum_Water_Level_Possible);
         AS_Put_Line("");
      end loop;
      Status_System.Water_Level_Measured := Water_Level_Range(Water);
   end Water_Level;



   procedure Wind_Level is
      Wind : Integer;
   begin
      AS_Put("Enter current wind speed (km/h): ");
      loop
         AS_Get(Wind, "Please type in a integer");
         exit when (Wind >=0) and (Wind <= Maximum_Wind_Level_Possible);
         AS_Put("Please type in a value between 0 and ");
         AS_Put(Maximum_Wind_Level_Possible);
         AS_Put_Line("");
      end loop;
      Status_System.Wind_Level_Measured := Wind_Level_Range(Wind);
   end Wind_Level;



   procedure Pressure_Level is
      Pressure : Integer;
   begin
      AS_Put("Enter current pressure (atm): ");
      loop
         AS_Get(Pressure, "Please type in a integer");
         exit when (Pressure >=0) and (Pressure <= Maximum_Pressure_Level_Possible);
         AS_Put("Please type in a value between 0 and ");
         AS_Put(Maximum_Pressure_Level_Possible);
         AS_Put_Line("");
      end loop;
      Status_System.Pressure_Level_Measured := Pressure_Level_Range(Pressure);
   end Pressure_Level;



   procedure Sismo_Level is
      Sismo : Integer;
   begin
      AS_Put("Enter current Earthquake magnitude (Mw): ");
      loop
         AS_Get(Sismo, "Please type in a integer");
         exit when (Sismo >=0) and (Sismo <= Maximum_Sismo_Level_Possible);
         AS_Put("Please type in a value between 0 and ");
         AS_Put(Maximum_Sismo_Level_Possible);
         AS_Put_Line("");
      end loop;
      Status_System.Sismo_Level_Measured := Sismo_Level_Range(Sismo);
   end Sismo_Level;



   procedure Rain_Level is
      Rain : Integer;
   begin
      AS_Put("Enter rainfall measurement (mm): ");
      loop
         AS_Get(Rain, "Please type in a integer");
         exit when (Rain >=0) and (Rain <= Maximum_Rain_Level_Possible);
         AS_Put("Please type in a value between 0 and ");
         AS_Put(Maximum_Rain_Level_Possible);
         AS_Put_Line("");
      end loop;
      Status_System.Rain_Level_Measured := Rain_Level_Range(Rain);
   end Rain_Level;



   procedure Snow_Level is
      Snow : Integer;
   begin
      AS_Put("Enter sownfall measurement (cm): ");
      loop
         AS_Get(Snow, "Please type in a integer");
         exit when (Snow >=0) and (Snow <= Maximum_Snow_Level_Possible);
         AS_Put("Please type in a value between 0 and ");
         AS_Put(Maximum_Snow_Level_Possible);
         AS_Put_Line("");
      end loop;
      Status_System.Snow_Level_Measured := Snow_Level_Range(Snow);
   end Snow_Level;




      function Open_Gate_To_String(Open_Dam_Gate : Open_Dam_Gate_Type) return String is
      begin
         if (Open_Dam_Gate = Activated)
         then
            return "Activated";
         else return "Not activated";
         end if;
      end Open_Gate_To_String;



      function Open_Emergency_Gate_To_String(Open_Gate_Emergency : Open_Gate_Emergency_Type) return String is
      begin
         if (Open_Gate_Emergency = Activated)
         then
            return "Activated";
         else return "Not activated";
         end if;
      end Open_Emergency_Gate_To_String;




      function Number_of_Gates_To_String(Number_of_Gates_on_Emerg : Number_of_Gates_Type) return String is
      begin
         if (Number_of_Gates_on_Emerg = All_Gates) then
            return "All Gates";
         elsif (Number_of_Gates_on_Emerg = Few_Gates) then
            return "Few Gates";
         else return "No Gates";
         end if;
      end Number_of_Gates_To_String;





      function Rate_of_Gates_To_String(Rate_of_Gates_on_Emerg : Rate_of_Gate_Type) return String is
      begin
         if (Rate_of_Gates_on_Emerg = Full_Rate) then
            return "Full Rate";
         elsif (Rate_of_Gates_on_Emerg = Low_Rate) then
         return "Low Rate";
      else return "No Rate";
      end if;
   end Rate_of_Gates_To_String;



   procedure Print_Status is
   begin
      AS_Put("Water Level =     ");
      AS_Put(Integer(Status_System.Water_Level_Measured));
      AS_Put_Line("");
      AS_Put("Wind Level =      ");
      AS_Put(Integer(Status_System.Wind_Level_Measured));
      AS_Put_Line("");
      AS_Put("Pressure Level =  ");
      AS_Put(Integer(Status_System.Pressure_Level_Measured));
      AS_Put_Line("");
      AS_Put("Sismo Level =     ");
      AS_Put(Integer(Status_System.Sismo_Level_Measured));
      AS_Put_Line("");
      AS_Put("Rainfall Level =  ");
      AS_Put(Integer(Status_System.Rain_Level_Measured));
      AS_Put_Line("");
      AS_Put("Snowfall Level =  ");
      AS_Put(Integer(Status_System.Snow_Level_Measured));
      AS_Put_Line("");
      AS_Put_Line("");
      AS_Put("Opening Dam Gates automatically in case of emergency =  ");
      AS_Put_Line(Open_Emergency_Gate_To_String(Status_System.Open_Gate_Emergency));
      AS_Put_Line("");
      AS_Put("Number of gates opened =  ");
      AS_Put(Number_of_Gates_To_String(Status_System.Number_of_Gates_on_Emerg));
      AS_Put_Line("");
      AS_Put("Rate of each gates opened =  ");
      AS_Put(Rate_of_Gates_To_String(Status_System.Rate_of_Gate_on_Emerg));
      AS_Put_Line("");
      AS_Put("Open Dam Gates manually =  ");
      AS_Put_Line(Open_Gate_To_String(Status_System.Open_Dam_Gate));
      AS_Put_Line("");
   end Print_Status;



      procedure Gate_Monitor_System  is
      begin
         if (Integer(Status_System.Water_Level_Measured) > Critical_Water_Level) and
           (Integer(Status_System.Pressure_Level_Measured) > Critical_Pressure_Level) and
           (Integer(Status_System.Rain_Level_Measured) < Critical_Rain_Level)
         then Status_System.Open_Dam_Gate := Not_Activated;
            Status_System.Open_Gate_Emergency := Activated;
            Status_System.Number_of_Gates_on_Emerg := All_Gates;
            Status_System.Rate_of_Gate_on_Emerg := Full_Rate;
         elsif (Integer(Status_System.Sismo_Level_Measured) > Critical_Sismo_Level)
         then Status_System.Open_Dam_Gate := Not_Activated;
            Status_System.Open_Gate_Emergency := Activated;
            Status_System.Number_of_Gates_on_Emerg := No_Gates;
            Status_System.Rate_of_Gate_on_Emerg := No_Rate;
         elsif (Integer(Status_System.Water_Level_Measured) < Critical_Water_Level) and
           (Integer(Status_System.Rain_Level_Measured) > Critical_Rain_Level)
         then Status_System.Open_Dam_Gate := Not_Activated;
            Status_System.Open_Gate_Emergency := Not_Activated;
            Status_System.Number_of_Gates_on_Emerg := No_Gates;
            Status_System.Rate_of_Gate_on_Emerg := No_Rate;
         elsif (Integer(Status_System.Water_Level_Measured) > Critical_Water_Level) and
           (Integer(Status_System.Rain_Level_Measured) < Critical_Rain_Level)
         then Status_System.Open_Dam_Gate := Not_Activated;
            Status_System.Open_Gate_Emergency := Activated;
            Status_System.Number_of_Gates_on_Emerg := Few_Gates;
            Status_System.Rate_of_Gate_on_Emerg := Low_Rate;
         elsif (Integer(Status_System.Water_Level_Measured) > Critical_Water_Level) or
           (Integer(Status_System.Wind_Level_Measured) > Critical_Wind_Level) or
           (Integer(Status_System.Pressure_Level_Measured) > Critical_Pressure_Level) or
           (Integer(Status_System.Rain_Level_Measured) > Critical_Rain_Level) or
           (Integer(Status_System.Snow_Level_Measured) > Critical_Snow_Level)
         then Status_System.Open_Dam_Gate := Activated;
            Status_System.Open_Gate_Emergency := Not_Activated;
            Status_System.Number_of_Gates_on_Emerg := No_Gates;
            Status_System.Rate_of_Gate_on_Emerg := No_Rate;
         else Status_System.Open_Dam_Gate := Not_Activated;
            Status_System.Open_Gate_Emergency := Not_Activated;
            Status_System.Number_of_Gates_on_Emerg := No_Gates;
            Status_System.Rate_of_Gate_on_Emerg := No_Rate;
         end if;
      end Gate_Monitor_System;


      procedure Init is
      begin
         AS_Init_Standard_Input;
         AS_Init_Standard_Output;
         Status_System := (Water_Level_Measured  => 0, Wind_Level_Measured => 0,
                           Pressure_Level_Measured => 0, Sismo_Level_Measured => 0,
                           Rain_Level_Measured => 0, Snow_Level_Measured => 0,
                           Open_Dam_Gate => Not_Activated, Number_of_Gates => 0, Rate_of_Gate => 0,
                           Number_of_Gates_on_Emerg => No_Gates, Rate_of_Gate_on_Emerg => No_Rate,
                           Open_Gate_Emergency => Not_Activated);
      end Init;




   end dam_control;

