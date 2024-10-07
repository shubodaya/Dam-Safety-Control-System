--  My name is Shubodaya Heggur Narendra Kumar (2340644)
--  Group partner: Varun Shiva Prasad (2340648)
pragma SPARK_Mode;
with SPARK.Text_IO;use  SPARK.Text_IO;

package dam_control is
   
   
   Maximum_Water_Level_Possible : constant Integer := 100;
   Critical_Water_Level : constant Integer := 80;
   Maximum_Wind_Level_Possible : constant Integer := 15;
   Critical_Wind_Level : constant Integer := 10;
   Maximum_Pressure_Level_Possible : constant Integer := 5;
   Critical_Pressure_Level : constant Integer := 2;
   Maximum_Sismo_Level_Possible : constant Integer := 5;
   Critical_Sismo_Level : constant Integer := 2;
   Maximum_Rain_Level_Possible : constant Integer := 100;
   Critical_Rain_Level : constant Integer := 80;
   Maximum_Snow_Level_Possible : constant Integer := 10;
   Critical_Snow_Level : constant Integer := 5;
   Maximum_Number_of_Gates : constant Integer := 3;
   Maximum_Rate_of_Gate : constant Integer := 5;
    
   
   type Water_Level_Range is new Integer range 0 .. Maximum_Water_Level_Possible;
   type Wind_Level_Range is new Integer range 0 .. Maximum_Wind_Level_Possible;
   type Pressure_Level_Range is new Integer range 0 .. Maximum_Pressure_Level_Possible;
   type Sismo_Level_Range is new Integer range 0 .. Maximum_Sismo_Level_Possible;
   type Rain_Level_Range is new Integer range 0 .. Maximum_Rain_Level_Possible;
   type Snow_Level_Range is new Integer range 0 .. Maximum_Snow_Level_Possible;
   type Number_of_Gates_Range is new Integer range 0 .. Maximum_Number_of_Gates;
   type Rate_of_Gate_range is new Integer range 0 .. Maximum_Rate_of_Gate;
   type Number_of_Gates_Type is (All_Gates, Few_Gates, No_Gates);
   type Rate_of_Gate_Type is (Full_Rate,Low_Rate, No_Rate);
   type Open_Dam_Gate_Type is (Activated, Not_Activated);
   type Open_Gate_Emergency_Type is (Activated, Not_Activated);
   
   
   
   type Status_System_Type  is 
      record
         Water_Level_Measured   : Water_Level_Range;
         Wind_Level_Measured   : Wind_Level_Range;
         Pressure_Level_Measured   : Pressure_Level_Range;
         Sismo_Level_Measured   : Sismo_Level_Range;
         Rain_Level_Measured   : Rain_Level_Range;
         Snow_Level_Measured   : Snow_Level_Range;
         Number_of_Gates    : Number_of_Gates_Range;
         Rate_of_Gate     : Rate_of_Gate_range;
         Number_of_Gates_on_Emerg   : Number_of_Gates_Type;
         Rate_of_Gate_on_Emerg   : Rate_of_Gate_Type;
         Open_Dam_Gate : Open_Dam_Gate_Type;
         Open_Gate_Emergency   : Open_Gate_Emergency_Type;
      end record;

   
   
   Status_System : Status_System_Type;


   procedure Water_Level with
     Global => (In_Out => (Standard_Output, Standard_Input,Status_System)),
     Depends => (Standard_Output => (Standard_Output,Standard_Input),
                 Standard_Input  => Standard_Input,
                 Status_System   => (Status_System, Standard_Input));
     
   procedure Wind_Level with 
     Global => (In_Out => (Standard_Output, Standard_Input,Status_System)),
     Depends => (Standard_Output => (Standard_Output,Standard_Input),
                 Standard_Input  => Standard_Input,
                 Status_System   => (Status_System, Standard_Input));
   
   procedure Pressure_Level with
     Global => (In_Out => (Standard_Output, Standard_Input,Status_System)),
     Depends => (Standard_Output => (Standard_Output,Standard_Input),
                 Standard_Input  => Standard_Input,
                 Status_System   => (Status_System, Standard_Input));
     
   procedure Sismo_Level with
     Global => (In_Out => (Standard_Output, Standard_Input,Status_System)),
     Depends => (Standard_Output => (Standard_Output,Standard_Input),
                 Standard_Input  => Standard_Input,
                 Status_System   => (Status_System, Standard_Input));
   
   procedure Rain_Level with
     Global => (In_Out => (Standard_Output, Standard_Input,Status_System)),
     Depends => (Standard_Output => (Standard_Output,Standard_Input),
                 Standard_Input  => Standard_Input,
                 Status_System   => (Status_System, Standard_Input));
   
   procedure Snow_Level with
     Global => (In_Out => (Standard_Output, Standard_Input,Status_System)),
     Depends => (Standard_Output => (Standard_Output,Standard_Input),
                 Standard_Input  => Standard_Input,
                 Status_System   => (Status_System, Standard_Input));
   
     
   
     

   function Open_Gate_To_String(Open_Dam_Gate : Open_Dam_Gate_Type) return String;
   
   function Open_Emergency_Gate_To_String(Open_Gate_Emergency : Open_Gate_Emergency_Type) return String;
   
   function Number_of_Gates_To_String(Number_of_Gates_on_Emerg : Number_of_Gates_Type) return String;
   
   function Rate_of_Gates_To_String(Rate_of_Gates_on_Emerg : Rate_of_Gate_Type) return String;

   
   
   procedure Print_Status with
     Global => (In_Out => Standard_Output, 
                Input  => Status_System),
     Depends => (Standard_Output => (Standard_Output,Status_System));
   
   
   function Is_Safe (Status : Status_System_Type) return Boolean is
     (if (Integer(Status_System.Water_Level_Measured) > Critical_Water_Level) and
        (Integer(Status_System.Pressure_Level_Measured) > Critical_Pressure_Level) and
          (Integer(Status_System.Rain_Level_Measured) < Critical_Rain_Level)
      then Status.Open_Dam_Gate = Not_Activated and
           Status.Open_Gate_Emergency = Activated and
           Status.Number_of_Gates_on_Emerg = All_Gates and
           Status.Rate_of_Gate_on_Emerg = Full_Rate
      elsif (Integer(Status_System.Sismo_Level_Measured) > Critical_Sismo_Level)
      then Status_System.Open_Dam_Gate = Not_Activated and
           Status.Open_Gate_Emergency = Activated and
           Status.Number_of_Gates_on_Emerg = No_Gates and
           Status.Rate_of_Gate_on_Emerg = No_Rate
      elsif (Integer(Status_System.Water_Level_Measured) < Critical_Water_Level) and
            (Integer(Status_System.Rain_Level_Measured) > Critical_Rain_Level)
      then Status_System.Open_Dam_Gate = Not_Activated and
           Status.Open_Gate_Emergency = Not_Activated and
           Status.Number_of_Gates_on_Emerg = No_Gates and
           Status.Rate_of_Gate_on_Emerg = No_Rate
      elsif (Integer(Status_System.Water_Level_Measured) > Critical_Water_Level) and
        (Integer(Status_System.Rain_Level_Measured) < Critical_Rain_Level)
      then Status_System.Open_Dam_Gate = Not_Activated and
           Status.Open_Gate_Emergency = Activated and
           Status.Number_of_Gates_on_Emerg = Few_Gates and
           Status.Rate_of_Gate_on_Emerg = Low_Rate
      elsif (Integer(Status_System.Water_Level_Measured) > Critical_Water_Level) or
            (Integer(Status_System.Wind_Level_Measured) > Critical_Wind_Level) or
            (Integer(Status_System.Pressure_Level_Measured) > Critical_Pressure_Level) or
            (Integer(Status_System.Rain_Level_Measured) > Critical_Rain_Level) or
            (Integer(Status_System.Snow_Level_Measured) > Critical_Snow_Level)
      then Status.Open_Dam_Gate = Activated and
           Status.Open_Gate_Emergency = Not_Activated and
           Status.Number_of_Gates_on_Emerg = No_Gates and
           Status.Rate_of_Gate_on_Emerg = No_Rate
      else Status.Open_Dam_Gate = Not_Activated and
           Status.Open_Gate_Emergency = Not_Activated and
           Status.Number_of_Gates_on_Emerg = No_Gates and
           Status.Rate_of_Gate_on_Emerg = No_Rate);
   
    
   
   
   procedure Gate_Monitor_System with
     Global  => (In_Out => Status_System),
     Depends => (Status_System => Status_System),
     Post    => Is_Safe(Status_System);
   

   
   procedure Init with
     Global => (Output => (Standard_Output,Standard_Input,Status_System)),
     Depends => ((Standard_Output,Standard_Input,Status_System) => null),
     Post    => Is_Safe(Status_System);
   
     
   
end dam_control;
