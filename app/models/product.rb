class Product < ActiveRecord::Base

	 attr_accessible :name, :category_id, :pic, :description, :brand, :zhou_num, :arch, :cnc, :longmen, 
	 :galvo, :plc, :fieldbus, :control, :output_instr, :electricity, :voltage, :driver_fieldbus, 
	 :motor, :linear_motor_range, :rotary_motor, :rotary_motor_range, :special_ap, :thrust_range, :driver, 
	 :oriented_form, :slip_special_ap, :sports, :driver_type, 
	 :bearing, :max_load, :nano_recommend, :precision, :reduction_ratio, :sports_type

	 validates_presence_of :name

	 belongs_to :category

	 mount_uploader :pic, ProductPicUploader

	 symbolize :brand, :in => {:"1" => "Aerotech", :"2" => "Kollmorgen", :"3" => "Delau Dau", :"4" => "Parker", 
	 	:"5" => "Akribis", :"6" => "Servotronix", :"7" => "Smac", :"8" => "Allied Motion", :"9" => "Renishaw",
	 	"10" => "Hengstler", "11" => "Thomson", "12" => "Heidenhain"}, :scopes => true, :allow_blank => true

  #轴数
	 symbolize :zhou_num, :in => {:"0" => "单轴", :"1" => "1-4轴", :"2" => "1-8轴", :"3" => "1-12轴", :"4" => "1-32轴", :"5" => "大于32轴"}, :scopes => true	, :allow_blank => true 
	 #架构
	 symbolize :arch, :in => {:"0" => "基于PC板卡", :"1" => "独立式控制"}, :scopes => true, :allow_blank => true
	 #支持数控CNC编程
	 symbolize :cnc, :in => {:"0" => "不支持", :"1" => "支持"}, :scopes => true, :allow_blank => true
	 #支持龙门同步方式
	 symbolize :longmen, :in => {:"0" => "不支持", :"1" => "支持"}, :scopes => true, :allow_blank => true
	 #支持GALVO整合
	 symbolize :galvo, :in => {:"0" => "不支持", :"1" => "支持"}, :scopes => true, :allow_blank => true
	 #支持PLC功能
	 symbolize :plc, :in => {:"0" => "不支持", :"1" => "支持"}, :scopes => true, :allow_blank => true
	 #现场总线类型
	 symbolize :fieldbus, :in => {:"0" => "EtherCAT", :"1" => "Ethernet/IP", :"2" => "Modbus RTU", :"3" => "Mobus TCP", :"4" => "PC104", 
	 	:"5" => "PCI", :"6" => "RS232/422", :"7" => "以太网/USB"}, :scopes => true, :allow_blank => true
  #控制指令
  symbolize :control, :in => {:"0" => "数字量PWM指令", :"1" => "模拟量10V指令", :"2" => "脉冲/方向组合指令"}, :scopes => true, :allow_blank => true

  #输出指令
  symbolize :output_instr, :in => {:"0" => "线性驱动器", :"1" => "线性/PWM驱动器", :"2" => "PWM驱动器", :"3" => "模拟量10V驱动器", :"4" => "脉冲驱动器"}, :scopes => true, :allow_blank => true
  #持续电流
  symbolize :electricity, :in => {:"0" => "0-10A", :"1" => "11-20A", :"2" => "21-30A", :"3" => "31-50A", :"4" => "50A以上"}, :scopes => true, :allow_blank => true
  #支持电压
  symbolize :voltage, :in => {:"0" => "直流", :"1" => "交流单相/三相 120/240V", :"2" => "交流三相240/480V"}, :scopes => true, :allow_blank => true
  #支持现场总线类型
  symbolize :driver_fieldbus, :in => {:"0" => "模拟", :"1" => "EtherCAT", :"2" => "以太网/IP", :"3" => "CANopen", :"4" => "EtherCAT与CANopen",
  	:"5" => "PROFINET RT", :"6" => "SynqNet", :"7" => "DeviceNet卡", :"8" => "PROFIBUS卡", :"9" => "SERCOS InterfaceTM卡"}, :scopes => true, :allow_blank => true

  #电机类型	
  symbolize :motor, :in => {:"0" => "旋转电机", :"1" => "直线电机"}, :scopes => true, :allow_blank => true
  #直线电机推力范围
  symbolize :linear_motor_range, :in => {:"0" => "18-170", :"1" => "171-400", :"2" => "401-700", :"3" => "701-1100"}, :scopes => true, :allow_blank => true
  #旋转电机类型
  symbolize :rotary_motor, :in => {:"0" => "力矩电机", :"1" => "无刷电机", :"2" => "直流有刷", :"3" => "无框电机", :"4" => "步进电机"}, :scopes => true, :allow_blank => true
  #旋转电机持续扭矩范围
  symbolize :rotary_motor_range, :in => {:"0" => "0-5", :"1" => "5-10", :"2" => "10-30", :"3" => ">30" }, :scopes => true, :allow_blank => true
  #特殊应用
  symbolize :special_ap, :in => {:"0" => "防爆电机", :"1" => "防水电机"}, :scopes => true, :allow_blank => true

  #推力范围
  symbolize :thrust_range, :in => {:"0" => "1-1000", :"1" => "1000-5000", :"2" => "5000-20000", :"3" => ">20000"}, :scopes => true, :allow_blank => true

  #驱动形式
  symbolize :driver, :in => {:"0" => "滚珠丝杠", :"1" => "皮带"}, :scopes => true, :allow_blank => true
  #导向形式
  symbolize :oriented_form, :in => {:"0" => "滚珠导向", :"1" => "滑块导向", :"2" => "滚轮导向"}, :scopes => true, :allow_blank => true
  #特殊应用
  symbolize :slip_special_ap, :in => {:"0" => "直线提升单元", :"1" => "搬运部件", :"2" => "RediMount系统"}, :scopes => true, :allow_blank => true

  #运动类型
  symbolize :sports, :in => {:"0" => "直线平台", :"1" => "旋转平台", :"2" => "直线X-Y平台", :"3" => "提升与Z轴平台", :"4" => "手动平台"}, :scopes => true, :allow_blank => true
  #驱动类型
  symbolize :driver_type, :in => {:"0" => "直驱", :"1" => "齿轮", :"2" => "螺杆", :"3" => "手动"}, :scopes => true, :allow_blank => true
  #轴承类型
  symbolize :bearing, :in => {:"0" => "空气轴承", :"1" => "机械轴承"}, :scopes => true, :allow_blank => true
  #最大负载
  symbolize :max_load, :in => {:"0" => "0-10", :"1" => "11-20", :"2" => "21-50", :"3" => "51-100", :"4" => "101-150", :"5" => "151-450", :"6" => ">450"}, :scopes => true, :allow_blank => true
  #高精纳米推荐
  symbolize :nano_recommend, :in => {:"0" => "不推荐", :"1" => "推荐"}, :scopes => true, :allow_blank => true

  #精度
  symbolize :precision, :in => {:"0" => "4弧分", :"1" => "8弧分", :"2" => "13弧分"}, :scopes => true, :allow_blank => true
  #减速比
  symbolize :reduction_ratio, :in => {:"0" => "1：1到100：1", :"1" => "1：1到500：1"}, :scopes => true, :allow_blank => true

  #运动形式
  symbolize :sports_type, :in => {:"0" => "直线类型", :"1" => "旋转类型"}, :scopes => true, :allow_blank => true


  




  
  


end
