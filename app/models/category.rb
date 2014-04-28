class Category < ActiveRecord::Base
	extend ActsAsTree::Presentation

	 attr_accessible :name, :pic, :description, :parent_id

	 has_many :products

	 mount_uploader :pic, CategoryPicUploader
	 acts_as_tree order: "name"

	 def product_attrs
	 	 case self.name || self.parent.try(:name)
	 	 when "控制器"
	 	 	 return [{"轴数" => "zhou_num"},{"架构" => "arch"},{"支持数控CNC编程" => "cnc"},{"支持龙门同步方式" => "longmen"}, 
	 	 	 	{"支持GALVO整合" => "galvo"}, {"支持PLC功能" => "plc"}, {"现场总线类型" => "fieldbus"}, {"控制指令" => "control"}]
	 	 when "驱动器"
	 	   return [{"输出指令" => "output_instr"},{"持续电流" => "electricity"},{"支持电压" => "voltage"},{"支持现场总线类型" => "driver_fieldbus"}]	 
	 	 when "电机"  
	 	 	 return [{"电机类型" => "motor"},{"直线电机推力范围" => "linear_motor_range"},{"旋转电机类型" => "rotary_motor"},
	 	 	 	{"旋转电机持续扭矩范围" => "rotary_motor_range"}, {"特殊应用" => "special_ap"}]	 
	 	 when "执行器"
	 	   return [{"推力范围" => "thrust_range"}]	 	 	
	 	 when "滑台和直线单元"
	 	   return [{"驱动形式" => "driver"}, {"导向形式" => "oriented_form"}, {"特殊应用" => "slip_special_ap"}]	 	 	  
	 	 when "高精密定位平台"
	 	   return [{"运动类型" => "sports"}, {"驱动类型" => "driver_type"}, {"轴承类型" => "bearing"}, {"最大负载" => "max_load"}, {"高精纳米推荐" => "nano_recommend"}]	 	 	    
	 	 when "减速机"
	 	   return [{"精度" => "precision"}, {"减速比" => "reduction_ratio"}]	 	 	      
	 	 when "测量反馈装置"
	 	   return [{"运动形式" => "sports_type"}]	 	 	        
	 	 end
	 end
end
