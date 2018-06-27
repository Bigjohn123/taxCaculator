//
//  PdMacro.h
//  Loopin
//
//  Created by light_bo on 2016/11/21.
//  Copyright © 2016年 Paramida-Di. All rights reserved.
//

#ifndef PdMacro_h
#define PdMacro_h

#import "PdColor.h"

/**
 * log
 */

#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

#define PDLog(val)  NSLog(@"<<info>> : %@", val)


/**
 *  UI size
 */
#define Pd_NavigationBar_Height 44
#define Pd_StatusBar_Height 20
#define Pd_Top_Bar_Height 64
#define Pd_Tab_Bar_Height 49

#define Pd_Main_StoryBoard [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]
#define Pd_View_Controller_Default_Manager [PdViewControllerManager defaultManager]

#define Pd_Screen_Height  [UIScreen mainScreen].bounds.size.height

#define Pd_Screen_width  [UIScreen mainScreen].bounds.size.width

#define Pd_Screen_Bounds  [UIScreen mainScreen].bounds



/**
 *
 *  SAMRateLimit
 */
#define Pd_Require_To_Log_On_Limit @"com.paramida.ico.limit.require.to.log.on"
#define Pd_Inquiry_New_Msg_Limit @"com.paramida.ico.limit.inquiry.new.msg"
#define Pd_Show_Network_Unavailable_Info_Limit @"com.paramida.ico.limit.show.network.available.info"
#define Pd_Show_Time_Out_Info_Limit @"com.paramida.ico.limit.show.time.out.info.limit"
#define Pd_Refresh_My_Msg_Data_Limit @"com.paramida.ico.limit.refresh.my.msg.data"
#define Pd_Copy_Group_Id_Limit @"com.paramida.ico.limit.copy.group.id.limit"
#define Pd_Custom_Hud_Display_Interval_Time_Limit @"com.paramida.ico.limit.custom.hud.display.interval.time"
#define Pd_Comment_Post_Time_Limit @"com.bodi.ico.limit.comment.post.time"
#define Pd_Update_Tabbar_Badge_Amount @"com.bodi.ico.limit.update.tabbar.badge.amount" //刷新 tabbar 小红点数量频次控制
#define Pd_Refresh_Discover_Page_Data_Limit @"com.bodi.ico.limit.refresh.discover.page.data" //刷新发现页频次控制
#define Pd_Refresh_Personal_Page_Data_Limit @"com.bodi.ico.limit.refresh.personal.page.data" //个人页刷新频次控制

#define Pd_Regular_Clicked_Time_Limit @"com.bodi.ico.limit.regular.clicked.time" //常规的点击频次控制

/**
 * keychain service
 *
 */
#define Pd_KeyChain_IM_Token_Service @"com.paramida.ico.keychain.service.im.token"
#define Pd_KeyChain_Device_Tolen_Service @"com.bodi.ico.keychain.service.device.token"


/**
 * noitificarion
 *
 */
#define Pd_LogIn_Success_Notification @"com.paramida.ico.notification.login.success"
#define Pd_Network_Status_Changed_Notification @"com.bodi.ico.network.status.changed.notification"
#define Pd_IM_Log_In_Success_Notification @"com.bodi.ico.im.log.in.success.notification"
#define Pd_User_Subscribe_Status_Change_Notification @"com.bodi.ico.subscribe.status.change.notification"
#define Pd_Delete_Post_Success_Notification @"com.bodi.ico.delete.post.success.notification"

#define PdYouTubeVideoPlayerViewControllerDidReceiveMetadataNotification @"PdYouTubeVideoPlayerViewControllerDidReceiveMetadataNotification"//视频能够加载到数据的通知
/**
 *  XCode
 *
 */
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


/**
 *   flag，一些标志信息
 *
 */
#define Pd_Announcement_Change_Group_Team_id @"com.paramida.ico.announcement.change.group.team.id" //发布公告时，对应的是群云信 id或者工会 id，该 key 有值时，说明有新公告
#define Pd_Last_Post_Game_Info_Key @"com.bodi.ico.last.post.game.info.key"//最后发帖的游戏信息
#define Pd_Last_Post_Game_Dic_Info_Key @"com.bodi.ico.last.post.game.dic.info.key"//最后发帖的游戏信息（字典）

/**
 *  群聊列表消息优先级
 *
 */
#define Pd_Chat_Msg_Read_Status @"com.paramida.ico.chat.msg.read.status"
#define Pd_Chat_Msg_Priority @"com.paramida.ico.chat.msg.priority"
#define Pd_Chat_Msg_Content @"com.paramida.ico.chat.msg.content"
#define Pd_Chat_Msg_Id @"com.paramida.ico.chat.msg.identity"
#define Pd_Chat_Msg_type @"com.paramida.ico.chat.msg.type"//
#define Pd_Chat_Msg_Memtion_User_Id @"om.paramida.ico.chat.msg.mention.userid"

#define Pd_Custom_Tip_Msg_Group_Member_Changed @"group_member"//成员变动(新成员加入、成员退出、成员踢出)
#define Pd_Custom_Tip_Msg_Group_Notice @"group_notice" //发布公告
#define Pd_Custom_Tip_Group_Rename @"group_rename" //群重命名
#define Pd_Custom_Tip_Group_Change_Authority @"group_change_authority" //成员身份变更
#define Pd_Custom_Tip_Group_Dismiss @"group_dismiss" //群解散




/**
 * 发现页界面尺寸配置
 *
 */
#define Pd_Discover_Page_Circle_Item_Width (Pd_Screen_width * 0.28)
#define Pd_Discover_Page_Both_Ends_Interval (20)
#define Pd_Discover_Page_My_Circle_Item_Height (11 + Pd_Discover_Page_Circle_Item_Width + 5 + 24 + 10)
#define Pd_Discover_Page_Suggest_Circle_Item_Height (11 + Pd_Discover_Page_Circle_Item_Width + 10 + 16 + 33)
#define Pd_Discover_Page_Circle_Item_Mini_Inter_Space ((Pd_Screen_width - Pd_Discover_Page_Both_Ends_Interval * 2 - Pd_Discover_Page_Circle_Item_Width * 3) / 2 - 2);




#endif /* PdMacro_h */
