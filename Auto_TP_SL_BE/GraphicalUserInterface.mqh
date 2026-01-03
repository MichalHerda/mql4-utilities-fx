//+------------------------------------------------------------------+
//|                                     Graphical User Interface.mqh |
//+------------------------------------------------------------------+
#property strict

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#include <Controls\Dialog.mqh>
#include <Controls\Button.mqh>
#include <Controls\Edit.mqh>
#include <Controls\CheckGroup.mqh>
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////                                ////////////////////
/////////////////          GUI CLASS             ////////////////////
/////////////////           DEFINES              ////////////////////
/////////////////                                ////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
//indent and gaps
#define INDENT_TOP                                     (10)
#define INDENT_LEFT                                    (12)
//for Button
#define BUTTON_HEIGHT                                  (30)
#define BUTTON_WIDTH                                   (105)
//for Edit
#define EDIT_HEIGHT                                    (30)
#define EDIT_WIDTH                                     (105)
//for CheckGroup
#define CHECK_HEIGHT                                   (40)
#define CHECK_WIDTH                                    (150)

/////////////////          GUI CLASSES           ////////////////////
/////////////////          DEFINITION            ////////////////////

//**************************************************************************************************************************************************************

/////////////////        CMainMenu CLASS         ////////////////////
/////////////////           DEFINITION           ////////////////////

class CMainMenu : public CAppDialog
  {
public:
      CButton                      m_button1 ;
      CButton                      m_button2 ;
      CButton                      m_button3 ;
      CEdit                        m_edit1 ;
      CEdit                        m_edit2 ;
      CEdit                        m_edit3 ;
      CEdit                        m_edit4 ;
      CCheckGroup                  m_check_group ;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                   CMainMenu (void) ;
                                  ~CMainMenu (void) ;
//--- create
      virtual bool                 Create (const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2) ;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- chart event handler
      virtual bool                 OnEvent (const int id,const long &lparam,const double &dparam,const string &sparam) ;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- create dependent controls    
      bool                         CreateButton1      (void) ;
      bool                         CreateButton2      (void) ;
      bool                         CreateButton3      (void) ;
      bool                         CreateEdit1        (void) ;
      bool                         CreateEdit2        (void) ;
      bool                         CreateEdit3        (void) ;
      bool                         CreateEdit4        (void) ;
      bool                         CreateCheckGroup   (void) ;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      void                         OnClickButton1     (void) ;
      void                         OnClickButton2     (void) ;
      void                         OnClickButton3     (void) ;
      void                         OnChangeCheckGroup (void) ;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   };
   
/////////////////            EVENT                 //////////////////
/////////////////           HANDLING               //////////////////

EVENT_MAP_BEGIN (CMainMenu)
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ON_EVENT (ON_CLICK,m_button1,OnClickButton1)
ON_EVENT (ON_CLICK,m_button2,OnClickButton2)
ON_EVENT (ON_CLICK,m_button3,OnClickButton3)
ON_EVENT (ON_CHANGE,m_check_group,OnChangeCheckGroup)
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
EVENT_MAP_END (CAppDialog)
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CMainMenu::CMainMenu (void)
  {
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CMainMenu::~CMainMenu (void)
  {
  }
/////////////////            CREATE                //////////////////

//+------------------------------------------------------------------+
//| Create                                                           |
//+------------------------------------------------------------------+
bool CMainMenu::Create (const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2)
  {
   if (!CAppDialog::Create(chart,name,subwin,x1,y1,x2,y2))
      return(false) ;
//--- create dependent controls
   if (!CreateButton1())
      return(false) ;
   if (!CreateButton2())
      return(false) ;
   if (!CreateButton3())
      return(false) ;
   if (!CreateEdit1())
      return(false) ;
   if (!CreateEdit2())
      return(false) ;
   if (!CreateEdit3())
      return(false) ;
   if (!CreateEdit4())
      return(false) ;   
   if (!CreateCheckGroup())
      return(false) ;
//--- succeed  
   return(true);
    }

/////////////////            CREATE                //////////////////
/////////////////           BUTTON 1               //////////////////

bool CMainMenu::CreateButton1(void)
  {
///--- coordinates
   double x1 = ( 2 * INDENT_LEFT )  ;
   double y1 = INDENT_TOP  ;
   double x2 = x1 + EDIT_WIDTH ;
   double y2 =  y1 + EDIT_HEIGHT ;
//--- create
   if(!m_button1.Create(m_chart_id,"Button1",m_subwin,x1,y1,x2,y2))
      return(false) ;
   if ( tooltip_enable == true) {
               if(!ObjectSetString(0,"Button1",OBJPROP_TOOLTIP,"Auto Stop Loss Enable/Disable \nPressed: ON \nNot Pressed: OFF"))
                  return(false) ; }
   if(!Add(m_button1))
      return(false) ;
   m_button1.Locking(true) ;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if ( AutoSL_Enable == false )  { ( m_button1.Pressed(false) ) ; ( m_button1.Text ("Auto SL / OFF ")  );  }
  if ( AutoSL_Enable == true  )  { ( m_button1.Pressed(true)  ) ; ( m_button1.Text ("Auto SL / ON " )  );  }
//--- succeed
   return(true) ;
  }

/////////////////            CREATE                //////////////////
/////////////////           BUTTON 2               //////////////////

bool CMainMenu::CreateButton2(void)
  {
///--- coordinates
   double x1 = ( 2 * INDENT_LEFT ) ;
   double y1 = ( 2 * INDENT_TOP ) + BUTTON_HEIGHT  ;
   double x2 = x1 + EDIT_WIDTH ;
   double y2=  y1 + EDIT_HEIGHT ;
//--- create
   if(!m_button2.Create(m_chart_id,"Button2",m_subwin,x1,y1,x2,y2))
      return(false) ;
   if ( tooltip_enable == true) { 
               if(!ObjectSetString(0,"Button2",OBJPROP_TOOLTIP,"Auto Take Profit Enable/Disable \nPressed: ON \nNot Pressed: OFF"))
                  return(false) ; }
   if(!Add(m_button2))
      return(false) ;
   m_button2.Locking(true) ;   
//////////////////////////////////////////////////////////////////////////////////////////////////////////////    
   if ( AutoTP_Enable == false )  { ( m_button2.Pressed(false) ) ; ( m_button2.Text ("Auto TP / OFF ")  );  }
   if ( AutoTP_Enable == true  )  { ( m_button2.Pressed(true)  ) ; ( m_button2.Text ("Auto TP / ON " )  );  }
//--- succeed
   return(true);
  }

/////////////////            CREATE                //////////////////
/////////////////           BUTTON 3               //////////////////

bool CMainMenu::CreateButton3(void)
  {
///--- coordinates
   double x1 = ( 2 * INDENT_LEFT ) ;
   double y1 = ( 3 * INDENT_TOP ) + ( 2.75 * BUTTON_HEIGHT ) ;
   double x2 = x1 + EDIT_WIDTH ;
   double y2=  y1 + EDIT_HEIGHT ;
//--- create
   if(!m_button3.Create(m_chart_id,"Button3",m_subwin,x1,y1,x2,y2))
      return(false) ;
   if ( tooltip_enable == true) { 
               if(!ObjectSetString(0,"Button3",OBJPROP_TOOLTIP,"Auto Breakeven Enable/Disable \nPressed: ON \nNot Pressed: OFF"))
                  return(false) ; }
   if(!Add(m_button3))
      return(false) ;
   m_button3.Locking(true) ;   
//////////////////////////////////////////////////////////////////////////////////////////////////////////////    
   if ( AutoBE_Enable == false )  { ( m_button3.Pressed(false) ) ; ( m_button3.Text ("Auto BE / OFF ")  );  }
   if ( AutoBE_Enable == true  )  { ( m_button3.Pressed(true)  ) ; ( m_button3.Text ("Auto BE / ON " )  );  }
//--- succeed
   return(true);
  }

/////////////////            CREATE                //////////////////
/////////////////            EDIT 1                //////////////////

bool CMainMenu::CreateEdit1(void)
  {
//--- coordinates
   int x1 = ( 4 * INDENT_LEFT ) + BUTTON_WIDTH  ;
   int y1 = INDENT_TOP  ;
   int x2 = x1 + EDIT_WIDTH ;
   int y2 = y1 + BUTTON_HEIGHT ;  
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- create
   if(!m_edit1.Create(m_chart_id,"Edit1",m_subwin,x1,y1,x2,y2))
      return(false) ;
   if ( !m_edit1.Text ( DoubleToString ( SL_Level, 0 ) ) )
      return(false) ;
   if(!m_edit1.ReadOnly(false))
      return(true) ;
   if(!m_edit1.TextAlign(ALIGN_CENTER))
      return(true) ;
   if ( tooltip_enable == true ) {
               if(!ObjectSetString(0,"Edit1",OBJPROP_TOOLTIP,"Enter The SL Value In Points \nMeasured From The Open Price \nEnter An Integer Value"))
                  return (false) ; }
   if ( !Add (m_edit1) )
      return(false) ;   
//--- succeed
   return(true);
  }


/////////////////            CREATE                //////////////////
/////////////////            EDIT 2                //////////////////

bool CMainMenu::CreateEdit2(void)
  {
//--- coordinates
   int x1 = ( 4 * INDENT_LEFT ) + BUTTON_WIDTH  ;
   int y1 = ( 2 * INDENT_TOP )  + EDIT_HEIGHT ;
   int x2 = x1 + BUTTON_WIDTH ;
   int y2 = y1 + BUTTON_HEIGHT;  
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- create
   if(!m_edit2.Create(m_chart_id,"Edit2",m_subwin,x1,y1,x2,y2))
      return(false);
   if(!m_edit2.Text( DoubleToString ( TP_Level  , 0 ) ) ) 
      return(false);
   if(!m_edit2.ReadOnly(false))
      return(true); 
   if(!m_edit2.TextAlign(ALIGN_CENTER))
      return(true);
   if ( tooltip_enable == true) {
               if(!ObjectSetString(0,"Edit2",OBJPROP_TOOLTIP,"Enter The TP Value In Points \nMeasured From The Open Price \nEnter An Integer Value"))
                  return(false) ; }
   if(!Add(m_edit2))
      return(false);   
//--- succeed
   return(true);
  }

/////////////////            CREATE                //////////////////
/////////////////            EDIT 3                //////////////////

bool CMainMenu::CreateEdit3(void)
  {
//--- coordinates
   int x1 = ( 4 * INDENT_LEFT )  + BUTTON_WIDTH ;
   int y1 = ( 3 * INDENT_TOP ) + ( 2 * EDIT_HEIGHT ) ;
   int x2 = x1 + BUTTON_WIDTH ;
   int y2 = y1 + BUTTON_HEIGHT; 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- create
   if(!m_edit3.Create(m_chart_id,"Edit3",m_subwin,x1,y1,x2,y2))
      return(false);
   if ( !m_edit3.Text(DoubleToString ( BE_Level, 0) ) )
      return(false);
   if(!m_edit3.ReadOnly(false))
      return(true);
   if(!m_edit3.TextAlign(ALIGN_CENTER))
      return(true);   
   if ( tooltip_enable == true) {
               if(!ObjectSetString ( 0,"Edit3",OBJPROP_TOOLTIP,"Enter BreakEven Level In Points \nMessured As Distance Beetween Open Price And New Stop Loss Level\nEnter An Integer Value ") )
                  return(false) ; }
   if(!Add(m_edit3))
      return(false);   
//--- succeed
   return(true);
  }

/////////////////            CREATE                //////////////////
/////////////////            EDIT 4                //////////////////

bool CMainMenu::CreateEdit4(void)
  {
//--- coordinates
   int x1 = ( 4 * INDENT_LEFT )  + BUTTON_WIDTH ;
   int y1 = ( 4 * INDENT_TOP ) + ( 3 * EDIT_HEIGHT ) ;
   int x2 = x1 + BUTTON_WIDTH ;
   int y2 = y1 + BUTTON_HEIGHT; 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//--- create
   if(!m_edit4.Create(m_chart_id,"Edit4",m_subwin,x1,y1,x2,y2))
      return(false);
   if (!m_edit4.Text ( DoubleToString (BE_ModLevel, 0 ) ) )
      return(false);
   if(!m_edit4.ReadOnly(false))
      return(true);
   if(!m_edit4.TextAlign(ALIGN_CENTER))
      return(true);   
   if ( tooltip_enable == true) {
               if(!ObjectSetString(0,"Edit4",OBJPROP_TOOLTIP,"Enter The Level That Has To Be Reached To Set The New Stop Loss On BreakEven Level Set Above\nEnter An Integer Value In Points "))
                  return(false) ; }
   if(!Add(m_edit4))
      return(false);   
//--- succeed
   return(true);
  }

/////////////////            CREATE                //////////////////
/////////////////          CHECK_GROUP             //////////////////

bool CMainMenu::CreateCheckGroup (void)
  {
   //--- coordinates
   int x1 = 5.5 * INDENT_LEFT ;
   int y1 = ( 5 * INDENT_TOP ) + ( 4 * BUTTON_HEIGHT ) ;
   int x2 = x1 + CHECK_WIDTH ;
   int y2 = y1 + CHECK_HEIGHT;
//--- create
   if(!m_check_group.Create(m_chart_id,"CheckGroup",m_subwin,x1,y1,x2,y2))
      return(false);  
   if(!Add(m_check_group))
      return(false); 
   if(!m_check_group.AddItem("     Apply To Buy ",1))
         return(false);
   if(!m_check_group.AddItem("     Apply To Sell ",2))
         return(false);
   if (Buy_Apply ==true  ) m_check_group.Check(0,1) ;
   if (Sell_Apply==true  ) m_check_group.Check(1,1) ;
   if (Buy_Apply==false  ) m_check_group.Check(0,0) ;
   if (Sell_Apply==false ) m_check_group.Check(1,0) ;
//--- succeed
   return(true) ;         
   }       

/////////////////            ON_CLICK              //////////////////
/////////////////            BUTTON 1              //////////////////

void CMainMenu::OnClickButton1(void)
  {
   if ( m_button1.Pressed() ) 
       { 
         AutoSL_Enable = true ; 
         m_button1.Text("Auto SL / ON") ; 
         if ( log_display_enable == true ) { Print ( "AutoSL_Enable = ", AutoSL_Enable ) ; }
        }
               else 
               { AutoSL_Enable = false ; m_button1.Text ( "Auto SL / OFF" ) ; 
               if ( log_display_enable == true ) { Print ( "AutoSL_Enable = ", AutoSL_Enable ) ; }
               }
  }

/////////////////            ON_CLICK              //////////////////
/////////////////            BUTTON 2              //////////////////

void CMainMenu::OnClickButton2(void)
  {
    if ( m_button2.Pressed() ) 
       { 
        AutoTP_Enable = true ; 
        m_button2.Text("Auto TP / ON") ; 
        if ( log_display_enable == true ) { Print ( "AutoTP_Enable = ", AutoTP_Enable ) ; }
       }
               else 
               { AutoTP_Enable = false ; m_button2.Text("Auto TP / OFF") ; 
               if ( log_display_enable == true ) { Print ( "AutoTP_Enable = ", AutoTP_Enable ) ; }
               }
  }
  
/////////////////            ON_CLICK              //////////////////
/////////////////            BUTTON 3              //////////////////

void CMainMenu::OnClickButton3(void)
  {
    if ( m_button3.Pressed() ) 
       { 
        AutoBE_Enable = true ; 
        m_button3.Text("Auto BE / ON") ; 
        if ( log_display_enable == true ) { Print ( "AutoBE_Enable = ", AutoTP_Enable ) ; }
       }
               else { AutoBE_Enable = false ; m_button3.Text("Auto BE / OFF") ; 
               if ( log_display_enable == true ) { Print ( "AutoBE_Enable = ", AutoTP_Enable ) ; }
               }
  }

/////////////////           ON_CHANGE              //////////////////
/////////////////          CHECK_GROUP             //////////////////

void CMainMenu::OnChangeCheckGroup(void) 
  {
//       Comment(__FUNCTION__+" : Value="+IntegerToString(m_check_group.Value()));
      if ( m_check_group.Value() == 0 )
           { Buy_Apply = false ; Sell_Apply = false ; if ( log_display_enable == true) { Print("BuyApply = ",Buy_Apply,"SELLApply = ",Sell_Apply); Print ( " Modifications Not Allowed " ) ; } }
      if ( m_check_group.Value() == 1 )    
           { Buy_Apply = true ; Sell_Apply = false ; if ( log_display_enable == true) { Print("BuyApply = ",Buy_Apply,"SELLApply = ",Sell_Apply); Print ( " Modification Allowed For BUY Positions, Modifications Not Allowed For SELL Positions " ) ;} }
      if ( m_check_group.Value() == 2 )    
           { Buy_Apply = false ; Sell_Apply = true ; if ( log_display_enable == true) { Print("BuyApply = ",Buy_Apply,"SELLApply = ",Sell_Apply); Print ( " Modification Allowed For SELL Positions, Modifications Not Allowed For BUY Positions " ) ;} }
      if ( m_check_group.Value() == 3 )    
           { Buy_Apply = true ; Sell_Apply = true ; if ( log_display_enable == true)  { Print("BuyApply = ",Buy_Apply,"SELLApply = ",Sell_Apply); Print ( " Modification Allowed For SELL Positions, Modifications Not Allowed For BUY Positions " ) ;} }
      if ( m_check_group.Value() > 3 )
           { Buy_Apply = false ; Sell_Apply =false ; if ( log_display_enable == true ) { Print("Error = ",GetLastError()," Restart Program ! ") ; } }
  }    